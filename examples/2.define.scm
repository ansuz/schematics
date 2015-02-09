; 2.define.scm

#|
  In the last file I wrote, I used two functions:
  (display x) which prints its argument with no newline
  and (newline) which prints a newline
  I'm going to show how to wrap these up into a single function (displayln x)
  So you can just print your output in one go.
|#

; First, you should probably understand a little bit about defining variables
; define takes two arguments, a token and an expression.
; A string is an expression, so there we go.

(define myString "This is the string that I want to print")

; you define functions by binding an identifier (in the form of a token)...
; to an anonymous function, called a lambda
; Let's look at the lambda first:
; You can execute a lambda immediately by wrapping it in parens

((lambda () ; note how this starts with two parens
  ; this anonymous function is already set to be executed.
  ; note also that it has no arguments
  (display myString) ; a lambda can sequence multiple expressions
  (newline))) ; newline is the second expression, then we close the lambda.

#|
  I executed the lambda immediately by simply allowing it to fall through
  into the enclosing parens.
  A lambda is just a value like anything else
  this means you can call it, or assign it to name with define
  binding identifiers to lambdas forms the basis of function definition.
|#

(define square ; bind this identifier 
  (lambda (x) (* x x))) ; to this expression

#|
  the thing to note here is that lisp doesn't use the 'return' keyword
  I say 'keyword' because 'return' is typically not a function
  it stands out from things you can define
  because the compiler does NOT treat it the same
  this is the beginning of the beauty of lisp.
  features which add additional rules complicate a language
  instead of a keyword, lisp implicitly returns the result
  of its last expression.

  What if you don't want to use that value?
  The answer is simple: DON'T
  For example, when you print, you are relying on side effects
  You can just neglect the output of a print function

  With that in mind, see below for a little bit of 'syntactic sugar'
  Instead of defining a keyword,
  you can define the goal expression as you would like to use it:
|#

(define (displayln aString)
  (display aString)
  (newline))

(displayln "Hello World!")
(displayln "Isn't Lisp elegant?")

; Either way of defining a function is equivalent
; but the second is a little more expressive
; since it has a different appearance
; than defining a more primitive variable
; it also saves you from having to type 'lambda'
