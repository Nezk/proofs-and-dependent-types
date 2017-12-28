module Ex3 where

open import Ex1 using (Bool; true; false)
open import Ex2 using (ℕ; zero; suc)

-- Definition of nine with the constructors suc and zero:

nine : ℕ
nine = suc (suc (suc (suc (suc (suc (suc (suc (suc zero))))))))

-- The type signature is optional.
ten = suc nine

{-

ten, suc nine and suc (suc (suc (suc (suc (suc (suc (suc (suc zero))))))))
equally represent the number 10, but only the last one is the so called normal form.

-}

{-

Peano representation of natural number constants which are greater than three are hard to read:

suc (suc (suc (suc (suc (suc (suc (suc (suc (suc (suc (suc zero)))))))))))

On the other hand, decimal representation which we are used to is easy to read:

12

-}

-- Agda needs special directives to allow decimal notations of constants in Peano representation:

{-# BUILTIN NATURAL ℕ #-}

-- Infix notation

data BinTree' : Set where
  x : BinTree'
  _+_ : BinTree' → BinTree' → BinTree'

{-

yields

BinTree' : Set
x : BinTree'
x + x : BinTree'
(x + x) + x : BinTree'
x + (x + x) : BinTree'
(x + x) + (x + x) : BinTree'

-}

-- Underscores in names like _+_ denote the space for the operands.
-- One can give the precedence with infix, infixl or infixr:

infixr 3 _+_

{-

yields

BinTree' : Set
x : BinTree'
x + x : BinTree'
(x + x) + x : BinTree'
x + x + x : BinTree'
(x + x) + x + x : BinTree'

-}

-- (so _+_ has right precedence)









