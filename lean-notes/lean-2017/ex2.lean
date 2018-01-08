constants α β γ : Type 
constants a1 a2 : α
constants b1 b2 : β
constants g1 g2 : γ

constant f : α → β
constant g : β → γ 

#check λ x : α, g (f x)

constant h : α → β → α
constant a : α → α

#check λ x : α, λ y : β, h (a x) y

#check λ b : β, λ x : α, x

#check λ (g : β → γ) (f : α → β) (x : α), g (f x)
#check λ (α β γ : Type) (g : β → γ) (f : α → β) (x : α), g (f x) 

constants m n : ℕ
constants b : bool

#print "Reducing pairs"
#reduce (m, n).1
#reduce (m, n).2

#print "Reducing booleans"
#reduce tt && ff
#reduce b && ff

#print "Reducing arithmetic expressions"
#reduce n + 0
#reduce n + 5

-- two terms that reduce to the same value are called "definitionally equal"

#eval 12345 * 54321 -- faster but less safer 



