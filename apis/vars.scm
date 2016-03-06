#!/usr/bin/csi -s

(define f (lambda vars
    (format #t "You passed ~A arguments to this function\n"
        (length vars))))

(f '(pew pew pew) 1 2 3)
; You passed 4 arguments to this function
