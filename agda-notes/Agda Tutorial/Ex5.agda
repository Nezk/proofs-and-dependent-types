module Ex5 where

open import Data.Nat
open import Data.Bool

-- Definition of List:

data List (A : Set) : Set where
  [] : List A
  _∷_ : A → List A → List A

infixr 5 _∷_

-- Interpretation: List A ∈ Set, where A ∈ Set. 

{-

Example: elements of List Bool:

[]  
true  ∷ []  
false ∷ []
true  ∷ true  ∷ []  
false ∷ true  ∷ []  
true  ∷ false ∷ []  
false ∷ false ∷ []  
…

-}

list : List ℕ
list = 28 ∷ 32 ∷ 42 ∷ 16 ∷ []

-- Define a Maybe set (lists with 0 or 1 elements)!

data Maybe (A : Set) : Set where
  Nothing : Maybe A
  Just : A → Maybe A

mayb¹ : Maybe ℕ
mayb¹ = Just 42

mayb² : Maybe ℕ
mayb² = Nothing

-- Define parametric trees (various sorts)!

data Tree (A : Set) : Set where
  Leaf : Tree A
  Node : A → Tree A → Tree A → Tree A

tree¹ : Tree ℕ
tree¹ = Node 13 (Node 42 Leaf Leaf) (Node 23 (Node 14 Leaf Leaf) Leaf)

data _×_ (A B : Set) : Set where
  _,_ : A → B → A × B

infixr 4 _,_
infixr 2 _×_

tup¹ : ℕ × ℕ
tup¹ = 4 , 6

-- _⊎_: Disjoint Union (Sum)

data _∪⁺_ (A B : Set) : Set where -- wtf?
  inj₁ : A → A ∪⁺ B
  inj₂ : B → A ∪⁺ B

infixr 1 _∪⁺_

-- Mutually recursive sets
-- List₁ and List₂ are mutually recursive parametric sets:

data List₁ (A B : Set) : Set
data List₂ (A B : Set) : Set

data List₁ (A B : Set) where
  []  : List₁ A B
  _∷_ : A → List₂ A B → List₁ A B

data List₂ (A B : Set) where
  _∷_ : B → List₁ A B → List₂ A B


list¹ : List₁ Bool ℕ
list¹ = true ∷ 42 ∷ false ∷ 10 ∷ []

-- Square, the set of square matrices with 2n rows, is nested,
-- because at least one of its constructors refers to the set defined with more complex parameter(s):

data T⁴ (A : Set) : Set where
  quad : A → A → A → A → T⁴ A

data Square (A : Set) : Set where
  zero : A → Square A
  suc : Square (T⁴ A) → Square A

sq¹ : Square ℕ
sq¹ = zero 42

t4¹ : T⁴ ℕ
t4¹ = quad 1 2 3 4

sq² : Square ℕ
sq² = suc (suc (zero (quad (quad 1 2 3 4) (quad 5 6 7 8) (quad 9 10 11 12) (quad 13 14 15 16))))

--               ^ zero возвращает тип Square (T⁴ ℕ)
--         ^ suc принимает тип T⁴




