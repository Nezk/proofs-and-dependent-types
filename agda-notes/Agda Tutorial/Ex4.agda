module Ex4 where

open import Ex1 using (Bool; true; false)
open import Ex2 using (ℕ; zero; suc)

-- To allow mutual definitions one should declare any set before using it:
-- Взаимные определения

data L : Set
data M : Set

data L where
  nil : L
  _∷_ : ℕ → M → L

data M where
  _∷_ : Bool → L → M

-- Note that : Set is missing in the definitions of sets declared before.


