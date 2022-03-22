#lang racket

; Macro for quickly defining transparent structures.
(define-syntax-rule (t-struct forms ...)
  (struct forms ... #:transparent))

; Clojure's two threading macros, recreated.
(define-syntax >-- ; Thread-First
  (syntax-rules ()
    [(>-- form)                         form]
    [(>-- form (sf args ...) forms ...) (>-- (sf form args ...) forms ...)]
    [(>-- form sf forms ...)            (>-- (sf form) forms ...)]))

(define-syntax --> ; Thread-Last
  (syntax-rules ()
    [(--> form)                         form]
    [(--> form (sf args ...) forms ...) (--> (sf args ... form) forms ...)]
    [(--> form sf forms ...)            (--> (sf form) forms ...)]))

; Of course, this is a utility library, so we want everything to be exported.
(provide (all-defined-out))
