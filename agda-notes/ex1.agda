module ex1 where

open import bool hiding ( _xor_ )
open import nat
--open import bool-thms
open import eq

ex1 = if tt then ff else tt -- ff

ex2 = if tt then 21 else 32 -- 21

{-
 if_then_else_ : ∀ {ℓ} {A : Set ℓ} → 𝔹 → A → A → A
                 ^ for all
                                ^ type level

The point of these variables is to express polymorphism.

The if-then-else operation works for any type A, from any type level ℓ
-}

ex3 = if tt then _&&_ else _||_

ex4 = if tt then 𝔹 else (𝔹 → 𝔹)

_xor_ : 𝔹 → 𝔹 → 𝔹
tt xor ff = tt
ff xor tt = tt
_ xor _ = ff

ex5 = (tt xor ff) xor (ff xor ff) -- tt

-- patch - delete  {-# BUILTIN REFL refl #-} in bool-thms.agda 

ex6 = ~ ~ tt ≡ tt

~~tt : ~ ~ tt ≡ tt
~~tt  = refl

-- https://youtu.be/a0RYbqpsL9Q
