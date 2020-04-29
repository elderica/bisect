;; vim:set shiftwidth=2 tabstop=2 expandtab:
(defpackage bisect
  (:use :cl)
  (:export bisect-right
           bisect-left
           insort-right
           insort-left))
(in-package :bisect)

(defun bisect-right (seq x &optional (lo 0) (hi (length seq)))
  "Return the index where to insert item x in sequence seq, assuming seq is sorted.

The return value i is such that all e in (subseq seq 0 i) have e <= x, and all e in
(subseq seq i) have e > x. So if x already appears in the sequence, i points just
beyond the rightmost x already there.

Optional args lo (default 0) and hi (default (length seq)) bound the
slice of seq to be searched."
  (check-type x (or number character string))
  (when (minusp lo)
    (error "lo must be non-negative"))
  (let ((cmp (etypecase x
               (number #'<)
               (character #'char<)
               (string #'string<))))
    (loop (unless (< lo hi) (return lo))
      (let ((mid (truncate (+ lo hi) 2)))
        (if (funcall cmp x (elt seq mid))
            (setf hi mid)
            (setf lo (1+ mid)))))))

(defun bisect-left (seq x &optional (lo 0) (hi (length seq)))
  "Return the index where to insert item x in sequence seq, assuming seq is sorted.

The return value i is such that all e in (subseq seq 0 i) have e < x, and all e in
(subseq seq i) have e >= x. So if x already appears in the sequence, i points just
before the leftmost x already there.

Optional args lo (default 0) and hi (default (length seq)) bound the
slice of seq to be searched."
  (check-type x (or number character string))
  (when (minusp lo)
    (error "lo must be non-negative"))
  (let ((cmp (etypecase x
               (number #'<)
               (character #'char<)
               (string #'string<))))
    (loop (unless (< lo hi) (return lo))
      (let ((mid (truncate (+ lo hi) 2)))
        (if (funcall cmp (elt seq mid) x)
            (setf lo (1+ mid))
            (setf hi mid))))))

(defun %list-insert-at (lst index new-value)
  (let ((retval nil))
    (loop for i from 0 to (1- (length lst)) do
      (when (= i index)
        (push new-value retval))
      (push (nth i lst) retval))
    (when (>= index (length lst))
      (push new-value retval))
    (nreverse retval)))

(defun %vector-insert-at (vec index new-value)
  (replace vec vec
           :start1 (1+ index)
           :start2 index
           :end2 (vector-push-extend new-value vec))
  (setf (aref vec index) new-value)
  vec)

(defun insort-right (seq x &optional (lo 0) (hi (length seq)))
 "Insert item x in sequence seq, and keep it sorted assuming seq is sorted.

If x is already in seq, insert it to the right of the rightmost x.

Optional args lo (default 0) and hi (default (length seq)) bound the
slice of seq to be searched. "
  (check-type seq (or list vector))
  (let ((lo (bisect-right seq x lo hi)))
    (etypecase seq
      (list (%list-insert-at seq lo x))
      (vector (%vector-insert-at seq lo x)))))

(defun insort-left (seq x &optional (lo 0) (hi (length seq)))
 "Insert item x in sequence seq, and keep it sorted assuming seq is sorted.

If x is already in seq, insert it to the left of the leftmost seq.

Optional args lo (default 0) and hi (default (length seq)) bound the
slice of seq to be searched. "
  (check-type seq (or list vector))
  (let ((lo (bisect-left seq x lo hi)))
    (etypecase seq
      (list (%list-insert-at seq lo x))
      (vector (%vector-insert-at seq lo x)))))
