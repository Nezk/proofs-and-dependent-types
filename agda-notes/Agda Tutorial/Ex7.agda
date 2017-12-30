module Ex7 where

open import Data.Empty using (⊥)
open import Data.Unit using (⊤; tt)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Data.Bool using (Bool; true; false)
open import Data.Nat using (ℕ; zero; suc)

-- Vec A n ~ An
-- Vec A n is an n-tuple of elements of A:

data Vec′ (A : Set) : ℕ → Set where
  [] : Vec′ A zero
  cons : (n : ℕ) → A → Vec′ A n → Vec′ A (suc n)

vec¹ : Vec′ ℕ 4
vec¹ = cons 3 39 (cons 2 40 (cons 1 41 (cons 0 42 [])))

-- Term Inference and Implicit Arguments

{-

The Agda compiler tries to infer terms marked with underscore.
If the choice of term is ambiguous, term inference fails.

-}

data Fin′ : ℕ → Set where
  zero : (n : _) → Fin′ (suc n) -- ℕ is inferred
  suc : (n : _) → Fin′ n → Fin′ (suc n) -- ℕ is inferred

x : Fin′ 3
x = suc _ (zero _)

vec² : Vec′ ℕ 3
vec² = cons _ 1 (cons _ 2 (cons _ 3 []))

-- Implicit arguments
-- Underscores can be hidden:
-- Make arguments of constructors implicit with curly brackets.

data Fin : ℕ → Set where
  zero : {n : _} → Fin (suc n)
  suc : {n : _} → Fin n → Fin (suc n)

x² : Fin 3
x² = suc zero

data Vec (A : Set) : ℕ → Set where
  [] : Vec A zero
  cons : {n : _} → A → Vec A n → Vec A (suc n)

vec³ : Vec ℕ 3
vec³ = cons 1 (cons 2 (cons 3 []))

-- Variables with inferred types can be introduced by ∀:

data Vec² (A : Set) : ℕ → Set where
  [] : Vec² A zero
  cons : ∀ {n} → A → Vec² A n → Vec² A (suc n)

vec⁴ : Vec² ℕ 3
vec⁴ = cons 1 (cons 2 (cons 3 []))


