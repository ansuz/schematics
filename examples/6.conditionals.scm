; 6.conditionals.scm

#|
  You'll have a hard time writing any significant piece of software
  without using conditionals, so we'd better cover how to do that.
|#

; here's the most basic type of conditional statement
(display (if #t "hello!" "Goodbye!"))
(newline)

; here's the most basic type of conditional statement
(display (if #f "hello!" "Goodbye!"))
(newline)

; use cond for conditionals with more than two conditions
; suppose we want to check the type of a value
(define (typeof x)
  (cond ; cond takes a variable number of arguments
    ((string? x) "string")
    ((list? x) "list")
    ((vector? x) "vector")
    (else "idk man")))

(display (typeof '(0 1 2 3)))
(newline)
