;;; Problem 2: Even Fibonacci Numbers

;;; ...By starting with 1 and 2, the first 10 terms will be:
;;; 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

;;; By considering the termins in the Fib. sequence whose values do not
;;; exceed four million, find the sum of the even-valued terms.

;; phi is defined as 1/2 (1 + sqrt5).
;; These are just convenience constants for Binet's formula

(ql:quickload :computable-reals)
(use-package :computable-reals) ;; Arbitrary precision is required.

(defvar *phi* (+r 1 (sqrt-r 5)))
(defvar *minus-phi* (-r 1 (sqrt-r 5))) 

;; Binet's formula
(defun binet (n)
  (approx-r (/r (-r (expt-r *phi* n) (expt-r *minus-phi* n)) (*r (expt-r 2 n) (sqrt-r 5))) 0))

(defvar *question-value-limit* 4000000)

;; This is quadratic time because of the exponentiation in
;; Binet's formula.
;; limit >= 2
(defun sum-even-fib (limit)
  (if (< limit 3) (return-from sum-even-fib 0))
  (let ((sum 0)
        )
    (do* ((i 3 (setf i (+ i 3))) ; Every 3rd fib number is even..
          (fib-number 2 (setf fib-number (binet i))))
         ((not (>= limit fib-number)) sum) ; for all fibonacci numbers < limit.
      (setf sum (+ sum fib-number)))))



