constants α β γ : Type
constant f : α → β
constant g : β → γ
constant b : β

#check λ x : α, x
#check λ x : α, b
#check λ x : α, g (f x)
#check λ x, g (f x)

#check λ b : β, λ x : α, x
#check λ (g : β → γ) (f : α → β) (x : α), g (f x)

#check λ (α β : Type) (b : β) (x : α), x
#check λ (α β γ : Type) (g : β → γ) (f : α → β) (x : α), g (f x)
