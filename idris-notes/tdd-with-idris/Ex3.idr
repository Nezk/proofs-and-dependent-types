module Ex3

import Data.Vect

createEmpties : Vect n (Vect 0 elem)

transposeHelper : (x : Vect n elem) -> (xs : Vect len (Vect n elem)) 
                  -> (xTrans : Vect n (Vect len elem)) -> Vect n (Vect (S len) elem)
                  
                  

transposeMat : Vect m (Vect n elem) -> Vect n (Vect m elem)
transposeMat [] = createEmpties
transposeMat (x :: xs) = let xTrans = transposeMat xs in
                         transposeHelper x xs xTrans

