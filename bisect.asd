;; vim:set shiftwidth=2 tabstop=2 expandtab syntax=lisp:
(defsystem "bisect"
  :version "0.1.0"
  :author "Kazuki Shigemichi"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Bisection algorithms"
  :in-order-to ((test-op (test-op "bisect/tests"))))

(defsystem "bisect/tests"
  :author ""
  :license ""
  :depends-on ("bisect"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for bisect"
  :perform (test-op (op c) (symbol-call :rove :run c)))
