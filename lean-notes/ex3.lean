def foo : (ℕ → ℕ) → ℕ := λ f, f 0

#check foo
#print foo 

def foo' := λ f : ℕ → ℕ, f 0 -- type inference 

def double (x : ℕ) : ℕ :=
  x + x

#print double 
#check double 3 
#reduce double 3
#eval double 123456789


def do_twice (f : ℕ → ℕ) (x : ℕ) : ℕ :=
  f (f x)


#reduce do_twice double 2

def compose (α β γ : Type) (g : β → γ) (f : α → β) (x : α) : γ :=
  g (f x)

#reduce (λ x, (do_twice double x) * 8) 5 -- exercise 1 => 160

def curry (α β γ : Type) (f : α × β → γ) : α → β → γ :=
  λ a b, (f (a, b))

def uncurry (α β γ : Type) (f : α → β → γ) : α × β → γ :=
  λ tuple, f tuple.1 tuple.2

/-
In Haskell:

Prelude> :t uncurry
uncurry :: (a -> b -> c) -> (a, b) -> c

Prelude> uncurry (+) $ (2, 3) 
5

but it doesnt work in Lean:

34:9: type mismatch at application
  uncurry has_add.add
term
  has_add.add
has type
  ?m_1 → ?m_1 → ?m_1 : Type ?
but is expected to have type
  Type : Type 1

I'll figure it out later
-/

namespace α

  -- from https://github.com/leanprover/lean/blob/master/library/init/function.lean#L124
 
  universes u1 u2 u3

  variables {α : Type u1} {β : Type u2} {φ : Type u3}

  def uncurry : (α → β → φ) → α × β → φ :=
    λ f ⟨a, b⟩, f a b -- wtf is ⟨ ⟩
                      -- maybe its analogue of haskell (x, y) tuple pattern matching?

  #reduce uncurry (+) (5, 5) -- 10

  #check curry

  def mul (t : ℕ × ℕ) : ℕ := t.1 * t.2

  #reduce mul (3, 5) -- => 15
  
  --#reduce curry mul

  /- Hm, α, β and γ have different universes.
    thats why uncurry from stdlib works.

    And this:

    but is expected to have type
    Type : Type 1

    Hints to us
  -/

end α

#check let y := 2 + 2 in y * y
#reduce let y := 2 + 2 in y * y

def t (x : ℕ) : ℕ :=
  let y := x + x in y * y 

#reduce t 2

-- let a := t1 in t2 is very similiar to the meaning of 
-- (λ a, t2) t1
-- but two are not the same 

--def bar := (λ a, λ x : a, x + 2) nat
/-

In Idris:

Idris> (\a => (\x => (the a x) + 2)) Nat
(input):1:31:a is not a numeric type

  /-
    В (λ x : a, x + 2) ещё не ясно что "x" имеет тип nat, а редуцируется 
    оно первым.
  -/

-/

namespace β

  namespace γ

    def n : ℕ := 42

  end γ

  #reduce γ.n * 3 -- => 126

  #check list.nil

  namespace ζ

    open γ

    #reduce n * 2 -- => 84

    open list

    #check cons

  end ζ

end β

