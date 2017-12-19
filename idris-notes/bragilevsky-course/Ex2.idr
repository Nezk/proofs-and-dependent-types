module Ex2 

import Data.Vect

ins : Ord a => (x : a) -> (xsSorted : Vect len a) -> Vect (S len) a
ins x [] = [x]
ins x (y :: xs) = if x <= y then x :: y :: xs
                  else y :: ins x xs


inssort : Ord a => Vect n a -> Vect n a
inssort [] = []
inssort (x :: xs) = 
  let xsSorted = inssort xs in
  ins x xsSorted

vhead : Vect (1 + n) a -> a
vhead (x :: xs) = x

vhead' : (n : Nat) -> (a : Type) -> Vect (1 + n) a -> a
vhead' n a (x :: xs) = x

zeroes : Vect n Nat
zeroes {n = Z} = []
zeroes {n = (S k)} = 0 :: zeroes

v : Vect 10 Nat
v = zeroes

data CPair : Type where
  MkCPair : Char -> Char -> CPair
  
mutual

  odd : Nat -> Bool
  odd Z = False
  odd (S n) = even n
  
  even : Nat -> Bool
  even Z = True
  even (S n) = odd n

vecLen : Vect n a -> Nat 
vecLen {n} xs = n 

rotate : Vect n a -> Vect n a
rotate [] = []
rotate (x :: xs) = go x xs
  where go : (x : a) -> (xs : Vect len a) -> Vect (S len) a
        go x [] = [x]
        go x (y :: xs) = y :: go x xs

fzTest : Fin 3
fzTest = FS $ FS FZ
