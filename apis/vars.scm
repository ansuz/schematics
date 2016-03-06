#!/usr/bin/csi -s

(define f (lambda vars
    (format #t "You passed ~A arguments to this function\n"
        (length vars))))

(f '(pew pew pew) 1 2 3)
; You passed 4 arguments to this function

; here's a shorter way to do the same thing
(define (g . vars)
    (format #t "You passed ~A arguments to this function\n"
        (length vars)))

(g 1 2 3)
; You passed 3 arguments to this function
