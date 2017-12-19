constants α β : Type
constants a1 a2 : α
constants b1 b2 : β

constant f : α → α
constant g : α → β
constant h : α → β → α
constant p : α → α → bool

#check λ x : α, f x
#check λ x : α, f (f x)
#check (λ x : α, f (f x)) a1 
#check λ x : α, h x b1
#check λ x : α, λ y : β, h (f x) y
#check λ (x : α) (y : β), h (f x) y
#check λ x y, h (f x) y
