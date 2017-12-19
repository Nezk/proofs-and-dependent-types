module Ex4 

import Data.Vect

tri : Vect 3 (Double, Double)
tri = [(0.0, 0.0), (3.0, 0.0), (0.0, 4.0)]

Position : Type
Position = (Double, Double)

tri' : Vect 3 Position
tri' = [(0.0, 0.0), (3.0, 0.0), (0.0, 4.0)]

Polygon : Nat -> Type 
Polygon n = Vect n Position -- test

tri'' : Polygon 3
tri'' = [(0.0, 0.0), (3.0, 0.0), (0.0, 4.0)]

summate : Int -> String -> Maybe (String, Int)
summate x y = 
  case the Int (cast y) of
    0 => Nothing 
    n => let x' = x + n
         in Just ("Sum = " ++ cast x', x')


