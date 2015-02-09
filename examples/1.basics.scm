; Welcome to my Scheme repository!
; These are line comments
; since we weren't going to be using semicolons
; Lisp relies exclusively on brackets
; I'm going to try to show why that's a beautiful thing


#|

  btw, this is a block comment
  If you have longer comments to write,
  enclose it like this #| pew |#

  Notice that the above block comment
  does not disrupt the outer comment blocks.
  That's because blocks nest properly,
  unlike code blocks in C or Javascript.

  This makes it easier for your to quickly comment out
  irrelevant sections without having to worry
  about code slipping through because of some
  internal closing comment that you forgot about.

|#

(display "pew") ; display prints, but doesn't append a newline
(newline) ; newline is a void function, use it just for its side effects

#|
  Now, I'd recommend learning how to compile:
  assuming you've installed chicken-scheme, call:
  `csc 1.basics.scm`
  and execute the resulting binary with:
  `./1.basics`
|#


