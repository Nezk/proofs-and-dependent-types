module Ex1 where

{-

module and where are keywords

The module name after module should correspond to the file name in the file system.
In this case the file name is Modules/Basic.agda (or Modules/Basic.lagda).
Syntax highlighting is added by loading the module in Emacs with C-c C-l.

-}

data Bool : Set where
  false : Bool
  true : Bool

{-

Bool is a Set
true is a Bool
false is a Bool
there is nothing else which is Bool
true and false are different

-}

{-

data and where are keywords

Set is the set of sets (a constant)

':' is pronounced "is a" or "type of", it has similar rule as '∈' in set theory.

We do not use the '∈' symbol because ':' and '∈' have different behaviour which will be highlighted later.

Indentation matters!

Spaces are needed!

We call true and false constructors of data type Bool (more explanations of constructors come later)

-}

-- Define a set named Answer with three elements, yes, no and maybe.

data Answer : Set where
  yes : Answer
  no : Answer
  maybe : Answer

-- Define a set named Quarter with four elements, east, west, north and south.

data Quarter : Set where
  east : Quarter
  west : Quarter
  north : Quarter
  south : Quarter

-- Suppose we have Bool' defined:

data Bool' : Set where
  true' : Bool'
  false : Bool'

-- Are Bool and Bool' the same sets?
-- NO

-- If not, which one is the "real" set of Booleans?
-- DEFINE "REAL"

{-

Bool and Bool' are definitionally different but they are isomorphic.

* Two sets are isomorphic if there is a one-to-one relation between their elements.

* We will represent isomorphisms in Agda later.

-}

-- We can define finite sets with n = 0, 1, 2, ... elements.

data ⊥ : Set where -- There is no constructor.

data ⊤ : Set where
  tt : ⊤

-- ⊥ and ⊤ have interesting interpretations as we will see.

-- Types vs. sets

{-

* The type of an element is unique ↔ an element can be member of different sets
  E.g. true cannot be the element of two different types at the same time.

* A type is not the collection of its elements ↔ a set is characterized by its elements
  E.g. there are different empty types.

-}

-- data defines types, not sets!

-- If we have multiple elements of the same type we can define them in one line:

data Test : Set where
  elem₁ elem₂ : Test
















