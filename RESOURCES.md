You may find that it is difficult to locate informative examples of Lisp code. It tends to be construed as a language primarily for academia, and it's true that it's far underrepresented in the wild.I'm going to try to curate a list of educational resources about Lisp, more specifically Scheme/Racket.

I'm also interested in Clojure, since it seems to have gotten more press than other Lisps recently. With that in mind, you may find articles on the subject interspersed, though I'm not really focusing on it.

* [This post](http://practicaltypography.com/why-racket-why-lisp.html) articulates many of the practical benefits of using Lisp outside of Computer Science.
* A somewhat old [comparison of Racket vs Clojure](http://programming-puzzler.blogspot.ca/2010/08/racket-vs-clojure.html).
* http://c2.com/cgi/wiki?WhyWeLoveLisp.
* Racket doesn't need types, but type annotations help the compiler optimize, enter [Typed Racket](http://docs.racket-lang.org/ts-guide/).
* You're probably so used to eager evaluation that you don't realize there's an alternative, enter [Lazy Racket](http://docs.racket-lang.org/lazy/).
* Racket is great for constructing DSLs, which is exactly why Naughty Dog Studios [used it for building tooling in the development of 'The Last of Us'](http://www.reddit.com/r/programming/comments/1gmvrb/realm_of_racket_is_finally_out/).
* Lisps are famous for making heavy use of bootstrapping in their implementations, which makes it them [a suitable platform for livecoding](http://www.pawfal.org/fluxus/projects-using-fluxus/).
* Looking for practical uses? Here's a [blog platform written in Scheme that uses Git for a backend](http://wingolog.org/projects/tekuti/). It features a REPL accessible via localhost which you can use to modify it at runtime.


