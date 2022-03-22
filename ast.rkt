#lang racket

(require "util.rkt")

; --- Root AST Node --
(t-struct astNode ())

; --- Expressions ---
(t-struct expression astNode ())

; Literals
(t-struct literal expression ())
(t-struct integer-literal literal (val))
(t-struct boolean-literal literal (val))
(t-struct char-literal literal (val))
(t-struct string-literal literal (val))
(t-struct pair-literal literal ())

; Other expression types
(t-struct ident expression (name))
(t-struct array-elem expression (array indices))

; Operand applications
(t-struct unOp expression (operand))
(t-struct binOp expression (lhs rhs))

; Unary operators
(t-struct un! unOp ())
(t-struct un- unOp ())
(t-struct unLen unOp ())
(t-struct unOrd unOp ())
(t-struct unChar unOp ())

; Binary operators
(t-struct bin+ binOp ())
(t-struct bin- binOp ())
(t-struct bin* binOp ())
(t-struct bin/ binOp ())
(t-struct bin% binOp ())
(t-struct bin> binOp ())
(t-struct bin>= binOp ())
(t-struct bin== binOp ())
(t-struct bin<= binOp ())
(t-struct bin< binOp ())
(t-struct bin!= binOp ())
(t-struct bin&& binOp ())
(t-struct bin|| binOp ())

; Just like the utility library, this is meant to be used all at once.
(provide (all-defined-out))
