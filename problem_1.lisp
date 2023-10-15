;; Project Euler problem 1. Multiples of 3 or 5.

;; If we list all the natural numbers below 10 that are multiples of 3 or 5,
;; we get 3, 5, 6, and 9. The sum of these multiples is 23.
;; Find the sum of all the multiples of 3 or 5 below 1000.


;; The trivial solution is a loop summing mod5 || mod 3.

;; This can be achieved in constant time using the sum of the arithmetic
;; progression

(defun sum-fizzbuzz (n)
   (- (+ (linear-summation (1- n) 3) (linear-summation (1- n) 5))
      (linear-summation (1- n) 15))
  )

(defun sum-fizzbuzz-linear (n)
  (let ((sum 0))
    (dotimes (i n sum)
     (when (or (= (mod i 5) 0) (= (mod i 3) 0))
         (setf sum (+ sum i))
         
         ))))

(defun linear-summation (n div)
  (* (coerce (floor (/ (+ (* (floor n div) (floor n div)) (floor n div)) 2)) 'integer) div))


(defun linear-summation-loop (n)
  (let ((sum 0)
        )
    (dotimes (i n sum)
      (setf sum (+ (1+ i) sum))
      (print i))))
