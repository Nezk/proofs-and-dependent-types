namespace hide
  
  universe u
  
  constant list : Type u → Type u

  namespace list
    
    constant cons   : Π α : Type u, α → list α → list α
  
    constant nil    : Π α : Type u, list α
  
    constant append : Π α : Type u, list α → list α → list α

  end list

end hide

namespace ω

  open hide.list

  variable α : Type

  variable a : α

  variables l1 l2 : hide.list α

  #check cons α a (nil α)

 
  #check append α (cons α a (nil α)) l1

  #check append α (append α (cons α a (nil α)) l1) l2


  #check cons _ a (nil _)

  #check append _ (cons _ a (nil _)) l1

  #check append _ (append _ (cons _ a (nil _)) l1) l2

end ω 

namespace ϕ

  universe u

  -- def ident {α : Type u} (x : α) := x

  section

    variable {α : Type u}
    variable x : α

    def ident := x

  end

  variables α β : Type u
  variables (a : α) (b : β)

  #check ident 
  #check ident a
  #check ident b

  #check @id 
  #check @id β 

end ϕ

#check list.nil
#check id

#check (id : ℕ → ℕ)

#check (2 : ℤ)

#reduce 2 + 2
