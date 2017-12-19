constant m : nat
constant n : nat
constants b1 b2 : bool

#check m
#check n
#check n + 0
#check m * (n + 0)
#check b1
#check b1 && b2
#check b1 || b2
#check tt

constant f : ℕ → ℕ
constant p : ℕ × ℕ
constant h : ℕ × ℕ → ℕ


#check f
#check p
#check h (m, n)
#check f n
#check p.1
#check p.2

#check bool
#check ℕ × bool

constants α β : Type
constant F : Type → Type
constant G : Type → Type → Type

#check α
#check F α
#check G α β
#check G α ℕ

#check α × β

#check list α
#check Type 

#check Prop

#check list
#check prod

universe u
constant γ : Type u
#check γ
#check Type u

#check fun x : ℕ, x + 5
#check λ x : ℕ, x + 5
