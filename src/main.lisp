;; vim:set shiftwidth=2 tabstop=2 expandtab:
(defpackage bisect
  (:use :cl)
  (:export bisect-right
           bisect-left
           insort-right
           insort-left))
(in-package :bisect)

(defun bisect-right (seq x &optional (lo 0) (hi (length seq)))
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
  (let ((lo (bisect-right seq x lo hi)))
    (etypecase seq
      (list (%list-insert-at seq lo x))
      (vector (%vector-insert-at seq lo x)))))

(defun insort-left (seq x &optional (lo 0) (hi (length seq)))
  (let ((lo (bisect-left seq x lo hi)))
    (etypecase seq
      (list (%list-insert-at seq lo x))
      (vector (%vector-insert-at seq lo x)))))
