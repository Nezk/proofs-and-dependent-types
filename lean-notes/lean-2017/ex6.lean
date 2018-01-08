namespace α

constant and : Prop → Prop → Prop
constant or : Prop → Prop → Prop
constant not : Prop → Prop
constant implies : Prop → Prop → Prop

variables p q r : Prop

#check p

#check and p q

constant Proof : Prop → Type

constant and_comm : Π p q : Prop,
  Proof (implies (and p q) (and q p))

#check and_comm p q -- Proof зависит от Prop (?)

constant modus_ponens :
  Π p q : Prop, Proof (implies p q) →  Proof p → Proof q

-- Вот тут я перестаю что-либо понимать и иду спать
-- Глава 3, стр. 23

end α

namespace β

constants p q : Prop

--theorem t1 : p → q → p := λ hp : p, λ hq : q, hp

/-
theorem t1 : p → q → p :=
assume hp : p,
assume hq : q,
show p, from hp
-/

theorem t1 (p q : Prop) (hp : p) (hq : q) : p := hp

#print t1

end β

namespace γ

  #reduce ¬true

  #reduce true ∧ false

  variables p q : Prop

  #check p → q → p ∧ q

  #check ¬p → p ↔ false 

  #check p ∨ q → q ∨ p

end γ
