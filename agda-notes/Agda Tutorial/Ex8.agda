module Ex8 where

open import Data.Nat using (ℕ; zero; suc)


-- Proofs as data

{-

It is beneficial to represent proofs as ordinary data; we can manipulate them like natural numbers.
The proofs of each proposition will have a distinct type.

-}

data ⊤ : Set where
  tt : ⊤

data ⊥ : Set where

-- We represent the proofs of the conjunction of two propositions A and B by the type A × B.
-- A × B has proofs of form a , b where a is a proof of A and b is a proof of B.

data _×_ (A B : Set) : Set where
  _,_ : A → B → A × B

infixr 4 _,_
infixr 2 _×_

-- We represent the proofs of the disjunction of two propositions A and B by the type A ⊎ B.
-- A ⊎ B has two different kinds of proofs:

{-

* inj₁ a, where a is proof of A,
* inj₂ b, where b is proof of B.

-}

data _⊎_ (A B : Set) : Set where
  inj₁ : A → A ⊎ B
  inj₂ : B → A ⊎ B

infixr 1 _⊎_

-- Construct one proof for each proposition if possible:
⊤×⊤ : ⊤ × ⊤
⊤×⊤ = tt , tt

-- ⊤ × ⊥ ; ⊥ × ⊥
-- Can't

⊤⊎⊤ : ⊤ ⊎ ⊤
⊤⊎⊤ = inj₁ tt

⊤⊎⊥ : ⊤ ⊎ ⊥
⊤⊎⊥ = inj₁ tt

-- ⊥ ⊎ ⊥
-- Can't

proof¹ : ⊥ ⊎ ⊤ ⊎ ⊤ × (⊥ ⊎ ⊥) ⊎ ⊤
proof¹ = inj₂ (inj₁ tt)

-- _≤_: Less-or-equal predicate

-- We wish to represent proofs of propositions n ≤ m (n, m = 0, 1, ...).
-- For this we define a set indexed with two natural numbers:

data _≤_ : ℕ → ℕ → Set where
  z≤n : {n : ℕ} → zero ≤ n
  s≤s : {m : ℕ} → {n : ℕ} → m ≤ n → suc m ≤ suc n

infix 4 _≤_

n¹ : 2 ≤ 3
n¹ = s≤s (s≤s (z≤n {1})) 

{-

z≤n {0} : 0 ≤ 0
z≤n {1} : 0 ≤ 1
z≤n {2} : 0 ≤ 2

s≤s (z≤n {0}) : 1 ≤ 1
     ^ 0 ≤ 0
^ suc 0 ≤ suc 0 ⇒ 1 ≤ 1

s≤s (z≤n {1}) : 1 ≤ 2
     ^ 0 ≤ 1
^ 1 ≤ 2

s≤s (s≤s (z≤n {2})) : 2 ≤ 4
         ^ 0 ≤ 2
    ^ 1 ≤ 3
^ 2 ≤ 4

-}

-- Proving non-emptiness

0≤1 : 1 ≤ 10
0≤1 = s≤s z≤n

-- Exercise: Prove that 3 ≤ 7!

3≤7 : 3 ≤ 7
3≤7 = s≤s (s≤s (s≤s (z≤n {4})))

7≤3 : 7 ≤ 3 → ⊥
7≤3 (s≤s (s≤s (s≤s ()))) -- () denotes a value in a trivially empty set.

4≤2 : 4 ≤ 2 → ⊥
4≤2 (s≤s (s≤s ()))

{-
data _isDoubleOf_ : ℕ → ℕ → Set where
  zeroD : 0 isDoubleOf 0
  sucD  : ∀ {n m} → (n isDoubleOf m) → (sucD (sucD n)) isDoubleOf (sucD m)

8isDoubleOf4 : 8 isDoubleOf 4
8isDoubleOf4 = sucD (sucD (sucD (sucD zeroD)))

9isDoubleOf4 : 9 isDoubleOf 4 → ⊥
9isDoubleOf4 (sucD (sucD (sucD (sucD ()))))
-}

data Odd : Set
data Even : Set

data Even where
  suc : Odd → Even

data Odd where
  one : Odd
  suc : Even → Odd

n² : Odd
n² = suc (suc (suc (suc one)))

data _≡_ : ℕ → ℕ → Set where
  eq⁰ : zero ≡ zero
  eq : ∀ {n m} → (n ≡ m) → (suc n) ≡ (suc m)

n³ : 3 ≡ 3
n³ = eq (eq (eq eq⁰))

-- Define non-equality _≠_ : ℕ → ℕ → Set!
{-
data _≠_ : ℕ → ℕ → Set where
  !eqᴳᵀ = 
-}

data _≤′_ : ℕ → ℕ → Set where
  ≤′-refl : ∀ {m} → m ≤′ m
  ≤′-step : ∀ {m n} → m ≤′ n → m ≤′ suc n

infix 4 _≤′_

n⁴ : 0 ≤′ 0
n⁴ = ≤′-refl {0}

n⁵ : 2 ≤′ 4
n⁵ = ≤′-step (≤′-step (≤′-refl {2}))

-- We define the set n + m ≡ k for each n : ℕ, m : ℕ and k : ℕ.
-- (2 + 2 ≡ 5 is a valid set too.)

-- The set n + m ≡ k will be non-empty if n + m = k.
-- (2 + 2 ≡ 4 is non-empty, 2 + 2 ≡ 5 is empty.)

data _+_≡_ : ℕ → ℕ → ℕ → Set where
  znn : ∀ {n} → zero + n ≡ n
  sns : ∀ {m n k} → m + n ≡ k → suc m + n ≡ suc k

n⁶ : 0 + 2 ≡ 2
n⁶ = znn

n⁷ : 2 + 1 ≡ 3
n⁷ = sns (sns (znn {1}))
--             ^ 0 + 1 ≡ 1
--        ^ 1 + 1 ≡ 2
--   ^ 2 + 1 ≡ 3

n⁸ : 5 + 5 ≡ 10
n⁸ = sns (sns (sns (sns (sns znn))))

n⁹ : 2 + 2 ≡ 5 → ⊥
n⁹ (sns (sns ()))

-- data _⊓_ : ℕ → ℕ → Set where
  


  
