constant m : nat
constant b : bool

#check m
#check b

#check b && b

constant f : ℕ → ℕ 

#check f

constant p : ℕ × ℕ

#check p.1

constant F : (ℕ → ℕ) → ℕ

#check F f

/-
constants α β : Type
constants αβ : prod α β

#check αβ
#check αβ.1
#check αβ.2
-/

#check Type 
#check Type 5

#check Prop 
#check list 

#check prod 

universe u
constant α : Type u
#check α

#check λ x : ℕ, x + 5
#reduce (λ x : ℕ, x + 5) 5



