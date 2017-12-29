module Ex6 where

open import Data.Empty using (⊥)
open import Data.Unit using (⊤; tt)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Data.Bool using (Bool; true; false)
open import Data.Nat using (ℕ; zero; suc)

-- Fin, family of finite sets

{-

n	Sets with n elements
0	Fin 0 ~ ⊥
1	Fin 1 ~ ⊤ ~ Maybe ⊥ ~ ⊤ ⊎ ⊥
2	Fin 2 ~ Bool ~ Maybe ⊤ ~ Maybe (Maybe ⊥) ~ ⊤ ⊎ ⊤ ⊎ ⊥
3	Fin 3 ~ Maybe Bool ~ Maybe (Maybe (Maybe ⊥)) ~ ⊤ ⊎ ⊤ ⊎ ⊤ ⊎ ⊥
4	Fin 4 ~ Maybe (Maybe (Maybe (Maybe ⊥))) ~ ⊤ ⊎ ⊤ ⊎ ⊤ ⊎ ⊤ ⊎ ⊥

-}

-- Fin is a set indexed with a natural number
-- (we use Fin because this is not the final definition of Fin):

data Fin : ℕ → Set where
  zero : (n : ℕ) → Fin (suc n)
  suc : (n : ℕ) → Fin n → Fin (suc n)

f¹ : Fin 1
f¹ = zero 0

f² : Fin 3
f² = zero 2

