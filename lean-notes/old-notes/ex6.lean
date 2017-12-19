def foo : (ℕ → ℕ) → ℕ := λ f, f 0

#check foo
#print foo

def foo' := λ f : ℕ → ℕ, f 0

def double (x : ℕ) : ℕ := x * 2

#print double 
#check double 3
#reduce double 3

def square (x: ℕ) := x * x

#reduce square 4

def do_twice (f: ℕ → ℕ) (x : ℕ) : ℕ := f (f x)

#reduce do_twice double 2

def compose (α β γ : Type) (g : β → γ) (f : α → β) (x : α) : γ := g (f x)

def curry (α β γ : Type) (f : α × β → γ) : α → β → γ := λ (a : α) (b : β), f (a, b)

def uncurry (α β γ : Type) (f : α → β → γ) : α × β → γ := λ (ab : α × β), f ab.1 ab.2

def t (x: ℕ) : ℕ := 
  let y := x + x in y * y

#reduce t 2

#check let y := 2 + 2, z := y + y in z * z
#reduce let y := 2 + 2, z := y + y in z * z

