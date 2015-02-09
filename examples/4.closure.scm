; 4.closure.scm

#|
  One of scheme's defining features is its support for 'lexical scoping'
  The easiest way to understand this is to view each lambda
  as having its own namespace.
  In this file I'm going to explore how you can use that
  to express very complex behaviour expressed in other languages as syntax.
  I'll use lexical scoping to implement object orientation.
|#

; This is the behaviour you're probably used to:

(define x 5) ; define a global variable
(display x) ; print your global variable.
(newline) ; no surprises here.

((lambda () ; a lambda instantiates its own namespace
  (define x 7) ; so this is a local variable
  (display x) ; we can print it
  (newline))) ; again, no surprises

(display x) ; let's just confirm that our global variable was unaffected.
(newline)

; here's where things get weird, nested lambdas...

(define counter ; let's start with some double open parens
  ((lambda () ; counter is not this lambda, it is the result of this lambda
    (define x 0) ; here's a local variable in the first lambda
    (lambda () ; now we define a nested lambda, it has access to the outer one
      (set! x (+ x 1)) ; 'define' is used to instantiate a variable
      x) ; 'set!' modifies an existing variable, out final expression returns 'x'
      )) ; these parens close the outer lambda, returning the inner one
      ) ; this paren closes the outer definition, binding it to the inner lambda

(define showCount ; let's wrap that up so we don't have to call display
  (lambda ()
    (display "The current value of x is: ")
    (display (counter))
    (newline)))

(showCount) ; the inner lambda increments the 'x' in the outer one
(showCount) ; each successive call modifies this 'x' 
(showCount) ; though we cannot access it in any other way.
(showCount) ; we've effectively created a 'private' variable
(showCount) ; everything that can be computed can be expressed as a lambda
(showCount) ; if you don't believe me, google 'lambda calculus'

; An 'object' is essentially a persistent namespace
; with the ability to access its members
; we have the persistence part, lets implement the access part
; I'm going to use filter, so I need srfi-1
(use srfi-1)

; first let's make a way of looking up values by name
; there are more efficient means of accomplishing this
; such as a hash table, but I want to keep things simple
 
(define (matchPair llist key) ; takes a list of lists and a key
  (car (filter 
    (lambda (x)
      (string=? (car x) key))
    llist)))

#|
  if we use filter, we'll get another list
  'car' is a function that returns the first element of a list
  we filter a list, looking for the a list with a 'car' matching our key
  the returned value is a one-element list, so we use 'car' to extract the value
|#

; now we can use that to create an object

(define myObject ; my object is going to use nested lambdas again
  ((lambda () ; this is the outer scope that a nested lambda will access
    (define name "Mud") ; an internal variable
    (define sayHi ; an internal function, or 'method' in OO parlance
      (lambda () 
        (display "Hi, I'm an object, and my name is ")
        (display name) ; introduce yourself
        (display ".")
        (newline)))
    (define getName ; a 'getter' method
      (lambda () name))
    (define setName ; a 'setter' method
      (lambda (newName) ; this one takes a single argument
        (set! name newName)))
    (define methods ; create a list of two element lists
      (map (lambda (key value) (cons key value)) ; 'cons' constructs a list
        (list "sayHi" "getName" "setName") ; map our list of keys to their values
        (list sayHi getName setName))) ; you can make a list of functions
    (define (getMethodByName methodName) ; 'cdr' gets the second element
      (cdr (matchPair methods methodName))) ; this is the method
    getMethodByName
    ))) ; done!

((myObject "sayHi")) ; you're probably more used to myObject.sayHi
((myObject "setName") "ansuz") ; myObject.setName('ansuz') modifies state
((myObject "sayHi")) ; call it again, and you see the changes
(display ((myObject "getName"))) ; fetch just the namestring
(newline)

; a more elaborate system would nest this further
; such that we could instantiate multiple such objects with their own state
; that would only require one more lambda
; to be really clever, we could use conditionals
; to make sure that a method were actually there.

; Lambdas are REALLY powerful and expressive.
; I might have jumped the gun by not covering simpler functions first
; I just wanted to show you what you can do with Lisp
; It's not strictly a functional language, as many people think
; It's probably the most general purpose, unopinionated language ever created
