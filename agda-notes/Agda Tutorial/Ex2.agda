module Ex2 where

open import Ex1 using (Bool; true; false)

-- The effect of this open import declaration is the same as if we copied the definition of Bool type here.
-- Note that we enumerated the constructors of Bool too.

-- Peano representation
-- We are looking for a representation natural numbers.
-- The simplest choice is the Peano representation which corresponds to the unary numeral system:

data ℕ : Set where
  zero : ℕ
  suc : ℕ → ℕ

{-

yields the infinite set of judgements

ℕ : Set
zero : ℕ
suc zero : ℕ
suc (suc zero) : ℕ
suc (suc (suc zero)) : ℕ
…

-}

-- Binary representation of ℕ

data ℕ⁺ : Set where
  one : ℕ⁺
  double : ℕ⁺ → ℕ⁺
  double+1 : ℕ⁺ → ℕ⁺

{-

yields (without ordering)

ℕ⁺ : Set
one : ℕ⁺
double one : ℕ⁺
double+1 one : ℕ⁺
double (double one) : ℕ⁺
double+1 (double one) : ℕ⁺
double (double+1 one) : ℕ⁺
double+1 (double+1 one) : ℕ⁺
double (double (double one)) : ℕ⁺

-}

data ℕ₂ : Set where
  zero : ℕ₂
  id : ℕ⁺ → ℕ₂

{-

yields

ℕ₂ : Set
zero : ℕ₂
id one : ℕ₂
id (double one) : ℕ₂
id (double+1 one) : ℕ₂
id (double (double one)) : ℕ₂
id (double+1 (double one)) : ℕ₂

-}

-- Soon we will prove in Agda that ℕ and ℕ₂ are isomorphic with the following relation:

-- Exercise: How 9 is represented in ℕ₂? Type-check the expression!

-- id (double+1 (double (double one)))
--     ^ 8 + 1   ^ 4     ^ 2     1

-- Define ℤ!

data ℤ : Set where
  pos : ℕ → ℤ
  neg : ℕ → ℤ

{-

3 ⇒ pos (suc (suc (suc zero)))

-3 ⇒ neg (suc (suc (suc zero)))

-}

-- Binary trees

data BinTree : Set where
  leaf : BinTree
  node : BinTree → BinTree → BinTree

{-

yields

BinTree : Set
leaf : BinTree
node leaf leaf : BinTree
node (node leaf leaf) leaf : BinTree
node leaf (node leaf leaf) : BinTree
node (node leaf leaf) (node leaf leaf) : BinTree

-}

-- Define binary trees

-- with natural number data attached to the leafs

data ℕleafTree : Set where
  leafℕ : ℕ → ℕleafTree
  node : ℕleafTree → ℕleafTree → ℕleafTree
  
-- with natural number data attached to the nodes

data ℕnodeTree : Set where
  leaf : ℕnodeTree
  node : ℕnodeTree → ℕ → ℕnodeTree → ℕnodeTree

-- with Booleans in the nodes and natural numbers in the leafs

data ℕ∧𝔹Tree : Set where
  leaf : ℕ → ℕ∧𝔹Tree
  node : ℕ∧𝔹Tree → Bool → ℕ∧𝔹Tree → ℕ∧𝔹Tree

--Define the lists (finite sequences) of natural numbers.

data Λℕ : Set where
  nil : Λℕ
  cons : ℕ → Λℕ → Λℕ

--Define the non-empty lists of natural numbers.
-- what?





