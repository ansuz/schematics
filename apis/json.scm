; apis/json.scm

#|
  Extensions to Scheme are called 'Eggs'
  Install the json eggs with:
  `sudo chicken-install abnf`
  `sudo chicken-install json-abnf`
|#

; abnf stands for 'augmented Backus-Naur form', which you can feel free to google
; json-abnf exports a function 'parser' which accepts valid json
; in the form of a string, and returns a list of lists
; containing the attributes of the json object
(use json-abnf)

(define parsed
  (parser "{\"key\":\"value\"}"))

; parsed is now a single element list, consisting of a 'cons cell'
; a cons cell is a two object list, essentially a 'key-value pair'
(display parsed)
(newline)

; this displays the following
;(("key" . "value"))

; this is a more complicated structure, 
(define nested
  (parser "{\"A\":{\"a\":2,\"b\":\"pewpewpew\"},\"B\":{\"c\":[\"bang!\",2.0,false],\"d\":true}}"))

(display nested)
(newline)

; The above expression returns the following nested list
#|
( (A ; A is an object with two attributes, a and b
    (a . 2) ; a is a number
    (b . pewpewpew)) ; b is a string
  (B ; B is another object, consisting of c and d
    (c . #(bang! 2.0 #f)) ; c is a 3 element array
      ; it consists of a string, a float, and a boolean 'false'
    (d . #t))) ; d is another boolean, 'true'
|#

; To list out all the keys used, you can map the 'car' function
; this returns the first element of any list
(display (map car nested)) ; (A B)
(newline)

; To access the values at a given scope, do the save with 'cdr'
; it retuns the second element of any list
; below, I use this on one of the nested lists
(display (map cdr (cdr nested))) ; (((c . #(bang! 2.0 #f)) (d . #t)))
(newline) ; map returns a list
; in this case, a list containing a two element list of lists


; You can use 'list-ref' to access members by their index, counting from zero
(display (list-ref nested 0))
(newline)
