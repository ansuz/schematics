; 5.delayed.scm

#|
  Like many other languages, Scheme has the ability to delay computation,
  though only when using a select few operations:
|#

; In Scheme, boolean values are represented as #t and #f
; 'and' takes a variable number of expressions
; it evaluates them in sequence, but never evaluates any of them
; once it has evaluated a single falsey expression
; I'll implement two functions first that will help demonstrate this

(define falsy
  (lambda ()
    (display "This expression is false\n")
    #f))
(define truthy
  (lambda ()
    (display "This expression is true\n")
    #t))

; the first expression evaluates as true, so the second is also evaluated
(display "Demonstrating 'and' behaviour:\n")
  (and (truthy) (falsy)) ; true false

; here, the first expression is false, and so the second is never evaluated
(display "Demonstrating 'and' behaviour:\n")
  (and (falsy) (truthy)) ; false

; 'or' works the opposite way, the first value is true
; as such, it never bothers evaluating the second, as it makes no difference
(display "Demonstrating 'or' behaviour:\n")
(or (truthy) (falsy)) ; true

; 'or' will keep on evaluating expressions until one of them returns true 
(display "Demonstrating 'or' behaviour:\n")
(or (falsy) (falsy) (truthy) (falsy)) ; false false true

#|
  Though it's possible you to do this directly with 'and' and 'or'
  Once either one is wrapped in a function, you cannot use this behaviour.
  That's because function arguments are otherwise eagerly evaluated
  before being passed into the function body.

  This limitation can be overcome, but you have to use macros to do it.
|#

(define (myAnd a b)
  (and a b))

(display "Demonstrating myAnd behaviour:\n")
(myAnd (falsy) (falsy)) ; false false -> returns false

(display "Demonstrating myAnd behaviour:\n")
(myAnd (falsy) (truthy)) ; false true -> returns false

(define-syntax und ; 'define-syntax' makes a macro
  (syntax-rules () ; macros replace the matched pattern
    ((und a b) ; <- this
      (and a b)))) ; <- with this, before ever executing anything

(display "Demonstrating und behaviour: \n")
(und (falsy) (truthy)) ; false

(display "Demonstrating und behaviour: \n")
(und (truthy) (falsy)) ; true false (exactly like 'and')

; between these three components, it's possible to force delayed computation
; in a variety of circumstances. There's more that can be done with macros
; but I'll leave it at that for now, and expand on them later.
