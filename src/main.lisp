;; vim:set shiftwidth=2 tabstop=2 expandtab:
(defpackage bisect
  (:use :cl)
  (:export bisect-right
           bisect-left))
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
