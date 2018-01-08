module Ex7

import Data.Vect 

zip' : Vect n a -> Vect n b -> Vect n (a, b)
zip' [] ys = []
zip' (x :: xs) (y :: ys) = (x, y) :: zip' xs ys

{-

Vect.index 3 [1,2,3,4,5] => 4

λΠ> :t Vect.index
index : Fin len -> Vect len elem -> elem

-}

tryIndex : Integer -> Vect n a -> Maybe a
tryIndex {n} i xs = case integerToFin i n of
                         Nothing => Nothing
                         (Just x) => Just $ index x xs

{-
vectTake : (i : Nat) -> Vect n a -> Vect i a
vectTake i [] = ?vectTake_rhs_3
vectTake i (x :: xs) = ?vectTake_rhs_2
-}



