section useful

  variables (α β γ : Type)
  variables (g: β → γ)(f: α → β)(h: α → α) 
  variable x : α

  def compose := g (f x)
  def do_twice := h (h x)
  def do_thrice := h (h (h x))

end useful

namespace foo

  def a : ℕ := 5
  def f (x : ℕ) : ℕ := x + 7

  #check a
  #check f

end foo

#reduce foo.f foo.a

namespace bar 

  open foo

  def c := f a

  #check c

end bar

#reduce bar.c


