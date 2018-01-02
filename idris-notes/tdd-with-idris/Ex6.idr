module Ex6 

data Expr = Val Int
          | Add Expr Expr
          | Sub Expr Expr 
          | Mul Expr Expr

mutual 
  evaluate : Expr -> Int
  evaluate (Val x) = x
  evaluate (Add x y) = eval (+) x y
  evaluate (Sub x y) = eval (-) x y
  evaluate (Mul x y) = eval (*) x y

  eval : (Int -> Int -> Int) -> Expr -> Expr -> Int          
  eval f x y = f (evaluate x) (evaluate y)

{-

λΠ> evaluate (Mul (Val 10) (Add (Val 6) (Val 3)))
90 : Int

-}

maxMaybe : Ord a => Maybe a -> Maybe a -> Maybe a
maxMaybe Nothing Nothing = Nothing
maxMaybe Nothing right@(Just x) = right
maxMaybe left@(Just x) Nothing = left
maxMaybe (Just x) (Just y) = Just $ max x y

-- Ex 6
-- Вспомнить что значат поля в Triangle Double Double

-- Defining dependent data types

data PowerSource = Petrol | Pedal

data Vehicle : PowerSource -> Type where
  Bicycle : Vehicle Pedal
  Car : (fuel : Nat) -> Vehicle Petrol
  Bus : (fuel : Nat) -> Vehicle Petrol

wheels : Vehicle power -> Nat
wheels Bicycle = 2
wheels (Car fuel) = 4
wheels (Bus fuel) = 4

refuel : Vehicle Petrol -> Vehicle Petrol
refuel (Car fuel) = Car 100
refuel (Bus fuel) = Bus 200
refuel Bicycle impossible

{-

For Vehicle, you’ve actually defined two types in one declaration 
(specifically, Vehicle Pedal and Vehicle Petrol). 
Dependent data types like Vehicle are therefore sometimes referred to as families of types,
because you’re defining multiple related types at the same time.
The power source is an index of the Vehicle family.
The index tells you exactly which Vehicle type you mean.

-}



