; 3.lists.scm

#|
  A program is a sequence of instructions for a computer.
  Lisp is built on the idea of using lists as a primary datatype,
  as such, a program is a list of instructions.
  Much of its expressive power stems from this relationship
  between source and data.

  In this file, I'll show a few of the core functions that operate on lists.
  Scheme is an incredibly minimal language,
  anything outside of the absolute core is not included by default.
  Extensions are written in this core, so you can leave them out
  and define your own versions if you'd prefer.

  Since lists are important, the first extension is 'SRFI-1',
  which defines some core list-processing functions.
  Chicken-Scheme provides a 'use' function to include modules.
|#

(use srfi-1) ; I'll point out which functions come from srfi-1

; this is myList, there are many lists like it, but this one is mine.
(define myList '(0 1 2 3 4))

(display myList)
(newline)

; Suppose you want to pass each argument of a list to a function
; use 'map' in the form (map <function> <list>)
(map (lambda (x) ; the passed function can be a lambda, or a defined function
  (display (* x 2)) ; there's no difference between the two
  (newline)) ; this is an anonymous doubling function
  myList) ; applied to myList

(newline)

; What if you don't want to use side effects?
; What if you want to collect the results of your operations into a new list?
; map does that implicitly, I just discarded the results in my last expression

(display ; display the output
  (map ; map does not modify the original list
    (lambda (x) (* 3 x)) ; it calls this function on each member
    myList)) ; and returns a new list
(newline)

; What about situations where we can to 'loop'
; and collect the results into a new atomic variable, like a number?
; in many languages, you'd have to use side effects

(display (apply + myList)) ; this will take the sum of a list
(newline) ; it's equivalent to (+ (+ (+ (+ 0 1) 2) 3) 4)
; (ECMA5 defines an array method 'reduce' which is equivalent)

; It's helpful to have a 'range' function.

(display ; 'iota' comes from srfi-1
  (iota 6 1)) ; it returns list, counting to its first argument from its second
(newline)


; Want to take the factorial of a number?

(define (fact x) 
  (apply * (iota x 1)))

(display "10!: ")
(display (fact 10))
(newline)

; What if you only want to operate on select elements of a list?
; srfi-1 provides a function 'filter' which selects only those elements
; which satisfy an expression

(display (filter ; the first argument is a function
  (lambda (x) (equal? 0 (modulo x 2))) ; check if a number is even
  myList))
(newline)
