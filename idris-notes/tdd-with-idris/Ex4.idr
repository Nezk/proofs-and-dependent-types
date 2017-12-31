module Ex4

import Data.Vect

append' : (elem : Type) -> (n : Nat) -> (m : Nat) -> Vect n elem -> Vect m elem -> Vect (n + m) elem
append' elem Z m [] ys = ys
append' elem (S k) m (x :: xs) ys = x :: append' elem k m xs ys

{-

λΠ> append Char 1 2 ['a'] ['c','d']
['a', 'c', 'd'] : Vect 3 Char

λΠ> append _ _ _ [1] [1,2,3]
[1, 1, 2, 3] : Vect 4 Integer

An underscore (_) in a function call means that you want Idris to work out 
an implicit value for the argument, given the information in the rest of the expression:

-}

append : {elem : Type} -> {n : Nat} ->{m : Nat} -> Vect n elem -> Vect m elem -> Vect (n + m) elem
append [] ys = ys
append (x :: xs) ys = x :: append xs ys


{-

λΠ> append {elem = Char} {n = 2} {m = 3}
append : Vect 2 Char -> Vect 3 Char -> Vect 5 Char

Here, you’ve partially applied append to its implicit arguments only, 
giving a specialized function for appending a vector of two Chars to a vector of three Chars.

-}

createEmpties : Vect n (Vect 0 a)
createEmpties {n = Z} = []
createEmpties {n = (S k)} = [] :: createEmpties

{-

λΠ> createEmpties
(input):Can't infer argument a to createEmpties, 
        Can't infer argument n to createEmpties
        
λΠ> createEmpties {a = Int} {n = 4}
[[], [], [], []] : Vect 4 (Vect 0 Int)

-}

