module Ex2 

import Data.Vect 

describeList : List Int -> String
describeList [] = "Empty"
describeList (x :: xs) = "Non-empty, tail = " ++ show xs

allLengths : List String -> List Nat
allLengths [] = []
allLengths (word :: words) = length word :: allLengths words

{-

- + Ex2.allLengths_rhs_1 [P]
 `-- List Nat

- + Ex2.allLengths_rhs_2 [P]
 `--                  word : String
                     words : List String
     ------------------------------------
      Ex2.allLengths_rhs_2 : List Nat
      
-}

{-

λΠ> allLengths ["Hello", "Interactive", "Editors"]
5 ::  : List Nat

-}

xor : Bool -> Bool -> Bool
xor False y = y
xor True y = not y

mutual 
  isEven : Nat -> Bool
  isEven Z = True
  isEven (S k) = isOdd k
  
  isOdd : Nat -> Bool
  isOdd Z = False
  isOdd (S k) = isEven k

fourInts : Vect 4 Int
fourInts = [0, 1, 2, 3]

sixInts : Vect 6 Int
sixInts = [4, 5, 6, 7, 8, 9]

tenInts : Vect 10 Int
tenInts = fourInts ++ sixInts

{-

λΠ> the (List _) ["Hello", "There"]
["Hello", "There"] : List String

λΠ> the (Vect _ _) ["Hello", "There"]
["Hello", "There"] : Vect 2 String

-}

allLengthsVec : Vect len String -> Vect len Nat 
allLengthsVec [] = []
allLengthsVec (x :: xs) = (length xs) :: allLengthsVec xs

insert : Ord elem => (x : elem) -> (xsSorted : Vect len elem) -> Vect (S len) elem
insert x [] = [x]
insert x (y :: xs) = if x < y then (x :: y :: xs)
                     else (y :: insert x xs)

insSort : Ord elem => Vect n elem -> Vect n elem
insSort [] = []
insSort (x :: xs) = let xsSorted = insSort xs in
                        insert x xsSorted

lengthVec : Vect len elem -> Nat
lengthVec {len} xs = len

length' : List a -> Nat
length' [] = 0
length' xs = foldr (\_, x => x + 1) 0 xs

reverse' : List a -> List a
reverse' [] = []
reverse' xs = foldl (flip (::)) [] xs

map' : (a -> a) -> List a -> List a
map' f [] = []
map' f (x :: xs) = (f x) :: (map' f xs)

mapVec : (a -> a) -> Vect len a -> Vect len a
mapVec f [] = []
mapVec f (x :: xs) = (f x) :: (mapVec f xs)

