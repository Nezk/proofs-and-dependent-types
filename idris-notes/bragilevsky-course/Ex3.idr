module Ex3 

import Data.Vect
import 

v : Vect 5 Nat
v = [1,2,3,4,5]

v3 : Nat
v3 = index 3 v

squareHead : Num a => List a -> a
squareHead (x :: xs) = x * x


-- squareHead (x :: xs) = x * x

{-
λΠ> squareHead [1,2,3]
1 : Integer
λΠ> squareHead [5,9,12]
25 : Integer
λΠ> squareHead []
squareHead [] : Integer
λΠ> 
-}

record Person where 
  constructor MkPerson 
  firstName, middleName, lastName : String 
  age : Int

fred : Person
fred = MkPerson "Fred" "Joe" "Bloggs" 30

john : Person
john = MkPerson "John" "Fredrik" "Dick" 42

record SizedClass (size : Nat) where
  constructor SizedClassInfo
  students : Vect size Person
  className : String

addStudent : Person -> SizedClass n -> SizedClass (S n)
addStudent p c = SizedClassInfo (p :: students c) (className c)

hi : IO ()
hi = do putStrLn "Введите ваше имя: "
        name <- getLine
        putStrLn $ "Привет, " ++ name ++ "!" 
        

