namespace α

universe u

constant vec : Type u → ℕ → Type u

namespace vec

  constant empty : Π α : Type u, vec α 0
  
  constant cons :
    Π (α : Type u) (n : ℕ), α → vec α n → vec α (n + 1)

  constant append :
    Π (α : Type u) (n m : ℕ), vec α m → vec α n → vec α (n + m)

end vec

variable α : Type
variable β : α → Type
variable a : α
variable b : β a

#check b
#check β -- принимает какое-то значение и возвращает тип 

end α

