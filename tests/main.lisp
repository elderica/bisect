;; vim:set shiftwidth=2 tabstop=2 expandtab:
(defpackage bisect/tests/main
  (:use :cl
        :bisect
        :rove))
(in-package :bisect/tests/main)

(deftest bisect-right-list-of-number-test
  (ok (eql (bisect:bisect-right '() 1) 0))
  (ok (eql (bisect:bisect-right '(1) 0) 0))
  (ok (eql (bisect:bisect-right '(1) 1) 1))
  (ok (eql (bisect:bisect-right '(1) 2) 1))
  (ok (eql (bisect:bisect-right '(1 1) 0) 0))
  (ok (eql (bisect:bisect-right '(1 1) 1) 2))
  (ok (eql (bisect:bisect-right '(1 1) 2) 2))
  (ok (eql (bisect:bisect-right '(1 1 1) 0) 0))
  (ok (eql (bisect:bisect-right '(1 1 1) 1) 3))
  (ok (eql (bisect:bisect-right '(1 1 1) 2) 3))
  (ok (eql (bisect:bisect-right '(1 1 1 1) 0) 0))
  (ok (eql (bisect:bisect-right '(1 1 1 1) 1) 4))
  (ok (eql (bisect:bisect-right '(1 1 1 1) 2) 4))
  (ok (eql (bisect:bisect-right '(1 1 1 1) 2) 4))
  (ok (eql (bisect:bisect-right '(1 2) 0) 0))
  (ok (eql (bisect:bisect-right '(1 2) 1) 1))
  (ok (eql (bisect:bisect-right '(1 2) 1.5) 1))
  (ok (eql (bisect:bisect-right '(1 2) 2) 2))
  (ok (eql (bisect:bisect-right '(1 2) 3) 2))
  (ok (eql (bisect:bisect-right '(1 1 2 2) 0) 0))
  (ok (eql (bisect:bisect-right '(1 1 2 2) 1) 2))
  (ok (eql (bisect:bisect-right '(1 1 2 2) 1.5) 2))
  (ok (eql (bisect:bisect-right '(1 1 2 2) 2) 4))
  (ok (eql (bisect:bisect-right '(1 1 2 2) 3) 4))
  (ok (eql (bisect:bisect-right '(1 2 3) 0) 0))
  (ok (eql (bisect:bisect-right '(1 2 3) 1) 1))
  (ok (eql (bisect:bisect-right '(1 2 3) 1.5) 1))
  (ok (eql (bisect:bisect-right '(1 2 3) 2) 2))
  (ok (eql (bisect:bisect-right '(1 2 3) 2.5) 2))
  (ok (eql (bisect:bisect-right '(1 2 3) 3) 3))
  (ok (eql (bisect:bisect-right '(1 2 3) 4) 3))
  (ok (eql (bisect:bisect-right '(1 2 2 3 3 3 4 4 4 4) 0) 0))
  (ok (eql (bisect:bisect-right '(1 2 2 3 3 3 4 4 4 4) 1) 1))
  (ok (eql (bisect:bisect-right '(1 2 2 3 3 3 4 4 4 4) 1.5) 1))
  (ok (eql (bisect:bisect-right '(1 2 2 3 3 3 4 4 4 4) 2) 3))
  (ok (eql (bisect:bisect-right '(1 2 2 3 3 3 4 4 4 4) 2.5) 3))
  (ok (eql (bisect:bisect-right '(1 2 2 3 3 3 4 4 4 4) 3) 6))
  (ok (eql (bisect:bisect-right '(1 2 2 3 3 3 4 4 4 4) 3.5) 6))
  (ok (eql (bisect:bisect-right '(1 2 2 3 3 3 4 4 4 4) 4) 10))
  (ok (eql (bisect:bisect-right '(1 2 2 3 3 3 4 4 4 4) 5) 10)))


(deftest bisect-right-forcia-test
  (ok (eql (bisect:bisect-right '(1 3 5 5 5 6 7) 5) 5)))

(deftest bisect-right-list-of-character-test
  (ok (eql (bisect:bisect-right '(#\a #\a #\b) #\a) 2)))


(deftest bisect-right-list-of-string-test
  (ok (eql (bisect:bisect-right '("hello" "world") "hello") 1)))


(deftest bisect-left-number-test
  (ok (eql (bisect:bisect-left '() 1) 0))
  (ok (eql (bisect:bisect-left '(1) 0) 0))
  (ok (eql (bisect:bisect-left '(1) 1) 0))
  (ok (eql (bisect:bisect-left '(1) 2) 1))
  (ok (eql (bisect:bisect-left '(1 1) 0) 0))
  (ok (eql (bisect:bisect-left '(1 1) 1) 0))
  (ok (eql (bisect:bisect-left '(1 1) 2) 2))
  (ok (eql (bisect:bisect-left '(1 1 1) 0) 0))
  (ok (eql (bisect:bisect-left '(1 1 1) 1) 0))
  (ok (eql (bisect:bisect-left '(1 1 1) 2) 3))
  (ok (eql (bisect:bisect-left '(1 1 1 1) 0) 0))
  (ok (eql (bisect:bisect-left '(1 1 1 1) 1) 0))
  (ok (eql (bisect:bisect-left '(1 1 1 1) 2) 4))
  (ok (eql (bisect:bisect-left '(1 1 1 1) 3) 4))
  (ok (eql (bisect:bisect-left '(1 2) 0) 0))
  (ok (eql (bisect:bisect-left '(1 2) 1) 0))
  (ok (eql (bisect:bisect-left '(1 2) 1.5) 1))
  (ok (eql (bisect:bisect-left '(1 2) 2) 1))
  (ok (eql (bisect:bisect-left '(1 2) 3) 2))
  (ok (eql (bisect:bisect-left '(1 1 2 2) 0) 0))
  (ok (eql (bisect:bisect-left '(1 1 2 2) 1) 0))
  (ok (eql (bisect:bisect-left '(1 1 2 2) 1.5) 2))
  (ok (eql (bisect:bisect-left '(1 1 2 2) 2) 2))
  (ok (eql (bisect:bisect-left '(1 1 2 2) 3) 4))
  (ok (eql (bisect:bisect-left '(1 2 3) 0) 0))
  (ok (eql (bisect:bisect-left '(1 2 3) 1) 0))
  (ok (eql (bisect:bisect-left '(1 2 3) 1.5) 1))
  (ok (eql (bisect:bisect-left '(1 2 3) 2) 1))
  (ok (eql (bisect:bisect-left '(1 2 3) 2.5) 2))
  (ok (eql (bisect:bisect-left '(1 2 3) 3) 2))
  (ok (eql (bisect:bisect-left '(1 2 3) 4) 3))
  (ok (eql (bisect:bisect-left '(1 2 2 3 3 3 4 4 4 4) 0) 0))
  (ok (eql (bisect:bisect-left '(1 2 2 3 3 3 4 4 4 4) 1) 0))
  (ok (eql (bisect:bisect-left '(1 2 2 3 3 3 4 4 4 4) 1.5) 1))
  (ok (eql (bisect:bisect-left '(1 2 2 3 3 3 4 4 4 4) 2) 1))
  (ok (eql (bisect:bisect-left '(1 2 2 3 3 3 4 4 4 4) 2.5) 3))
  (ok (eql (bisect:bisect-left '(1 2 2 3 3 3 4 4 4 4) 3) 3))
  (ok (eql (bisect:bisect-left '(1 2 2 3 3 3 4 4 4 4) 3.5) 6))
  (ok (eql (bisect:bisect-left '(1 2 2 3 3 3 4 4 4 4) 4) 6))
  (ok (eql (bisect:bisect-left '(1 2 2 3 3 3 4 4 4 4) 5) 10)))

(defun adjvec-from (lst)
  (let ((len (length lst)))
    (make-array len
                :fill-pointer len
                :adjustable t
                :initial-contents lst)))

(deftest insort-right-test
  (ok (let ((v (adjvec-from '(1 3 5 5 5 6 7))))
        (equalp
          (bisect:insort-right v 6)
          (vector 1 3 5 5 5 6 6 7))))
  (ok (let ((l (list 1 3 5 5 5 6 7)))
        (equalp
          (bisect:insort-right l 6)
          (list 1 3 5 5 5 6 6 7)))))

(deftest insort-left-test
  (ok (let ((v (adjvec-from '(1 3 5 5 5 6 7))))
        (equalp
          (bisect:insort-left v 2)
          (vector 1 2 3 5 5 5 6 7))))
  (ok (let ((l (list 1 3 5 5 5 6 7)))
        (equalp
          (bisect:insort-left l 2)
          (list 1 2 3 5 5 5 6 7)))))
