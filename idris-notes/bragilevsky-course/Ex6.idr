module Ex6 

import Data.Vect

data EqNat : (n1 : Nat) -> (n2 : Nat) -> Type where
  Same : (num : Nat) -> EqNat num num 
  
{-

λΠ> the (EqNat 3 3) (Same 3)
Same 3 : EqNat 3 3

λΠ> the (EqNat 3 3) (Same _)
Same 3 : EqNat 3 3

-}

checkEqNat : (num1 : Nat) -> (num2 : Nat) -> Maybe (EqNat num1 num2)
checkEqNat Z Z = Just (Same 0)
checkEqNat Z (S k) = Nothing
checkEqNat (S k) Z = Nothing
checkEqNat (S k) (S j) = case checkEqNat k j of
                              Nothing => Nothing
                              (Just (Same j)) => Just (Same (S j))

exactLength' : (len : Nat) -> Vect m a -> Maybe (Vect len a)
exactLength' {m} len xs = case checkEqNat m len of 
                             Nothing => Nothing
                             (Just (Same len')) => Just xs

{-

λΠ> the (3 = 3) Refl
Refl : 3 = 3

λΠ> the (2 + 2 = 4) Refl 
Refl : 4 = 4

-}

cong' : {f : a -> b} -> (x = y) -> f x = f y
cong' Refl = Refl

not2eq3 : (2 = 3) -> Void
not2eq3 Refl impossible

succNoZ : (S k = 0) -> Void
succNoZ Refl impossible

noRec : (contra : (k = j) -> Void) -> (S k = S j) -> Void
noRec contra Refl = contra Refl

zNotSucc : (0 = S k) -> Void
zNotSucc Refl impossible

checkEqNat' : (num1 : Nat) -> (num2 : Nat) -> Dec (num1 = num2)
checkEqNat' Z Z = Yes Refl
checkEqNat' Z (S k) = No zNotSucc
checkEqNat' (S k) Z = No succNoZ
checkEqNat' (S k) (S j) = case checkEqNat' k j of
                               (Yes Refl) => Yes Refl
                               (No contra) => No (noRec contra)
                               
exactLength2 : (len : Nat) -> Vect m a -> Maybe (Vect len a)
exactLength2 {m} len xs = 
  case decEq m len of
    Yes Refl => Just xs 
    No _ => Nothing

{-

data Elem : a -> Vect k a -> Type where
  Here : Elem x (x :: xs)
  There : (later : Elem x xs) -> Elem x (y :: xs)

-}

hasOne : Elem 1 [1,2,3]
hasOne = Here

hasFalse : Elem False [True, True, False]
hasFalse = There (There Here)

{-

hasZero : Elem 0 [1,2,3]
hasZero = There (There (There ?hasZero_rhs2))

-}

removeElem : DecEq a => (v : a) -> (xs : Vect (S n) a) -> Elem v xs -> Vect n a
removeElem v (v :: ys) Here = ys
removeElem {n = Z} _ (_ :: _) (There _) impossible
removeElem {n = (S k)} v (y :: ys) (There later) = y :: removeElem v ys later

removeElemAuto : DecEq a => (v : a) -> (xs : Vect (S n) a) -> {auto prf : Elem v xs} -> Vect n a
removeElemAuto v xs {prf} = removeElem v xs prf

-- if not(x <= y) then (x > y)
not_lte__gt : Not (x `LTE` y) -> x `GT` y
not_lte__gt {x = Z} contra = absurd (contra LTEZero)
not_lte__gt {x = (S k)} {y = Z} contra = LTESucc LTEZero
not_lte__gt {x = (S k)} {y = (S j)} contra = 
            LTESucc (not_lte__gt {x = k} {y = j} (\pf => contra (LTESucc pf)))
 


{-

-- if x > y then y <= x
gt__lte : x `GT` y -> y `LTE` x

-- if not(x <= y) then (y <= x)
not_lte__lt : Not (x `LTE` y) -> y `LTE` x

-}
