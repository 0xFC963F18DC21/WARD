#lang racket

(require "ast.rkt" data/applicative data/functor data/monad megaparsack megaparsack/text)

; Expression parsers are defined in this file.

; Integers.
(define sign/p
  (or/p (do (char/p #\-)
            (pure (λ (x) (- x))))
        (pure identity)))

; Like traditional WACC, signed 32-bit integers only.
(define wacc-int32/p
  (map integer-literal
    (guard/p (do [sign <- sign/p]
                 [integer <- integer/p]
                 (pure (sign integer)))
             (λ (x) (and (< x (arithmetic-shift 1 31))
                         (>= x (- (arithmetic-shift 1 31)))))
             "integer in range of a 32-bit integer")))

; Boolean literals.
(define wacc-bool/p
  (map boolean-literal
    (or/p (do (string/p "true")
              (pure #t))
          (do (string/p "false")
              (pure #f)))))
