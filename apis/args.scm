#!/usr/bin/csi -s
(define args (command-line-arguments)); load command line arguments (a list)

; map, but with a counted index as a second argument, like js
(define (map-with-index f A)
    (define i 1)
    (map
        (lambda (a)
            (f a i)
            (set! i (+ i 1)))
        A))

(define number-args (lambda (a i)
    (format #t "~A: ~A\n" i a)))

(map-with-index number-args args);
