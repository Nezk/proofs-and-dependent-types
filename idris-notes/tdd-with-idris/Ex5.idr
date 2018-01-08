module Ex5

{-

Enumerated types — Types defined by giving the possible values directly
  
Union types — Enumerated types that carry additional data with each value

Recursive types — Union types that are defined in terms of themselves

Generic types — Types that are parameterized over some other types

Dependent types — Types that are computed from some other value

-}

data Direction = North | East | South | West

turnClockwise : Direction -> Direction
turnClockwise North = East
turnClockwise East = South
turnClockwise South = West
turnClockwise West = North

-- Union types

||| Represents shapes
data Shape = Triangle Double Double
           | Rectangle Double Double
           | Circle Double
           
area : Shape -> Double
area (Triangle x y) = 0.5 * x * y
area (Rectangle x y) = x * y
area (Circle x) = pi * x * x

data Picture = Primitive Shape
             | Combine Picture Picture 
             | Rotate Double Picture 
             | Translate Double Double Picture
             
rectangle : Picture
rectangle = Primitive (Rectangle 20 10)

circle : Picture
circle = Primitive (Circle 5)

triangle : Picture
triangle = Primitive (Triangle 10 10)

testPicture : Picture 
testPicture = Combine (Translate 5 5 rectangle) (Combine (Translate 35 5 circle)
                      (Translate 15 25 triangle))
 
%name Shape shape, shape1, shape2
%name Picture pic, pic1, pic2 
                       
pictureArea : Picture -> Double
pictureArea (Primitive shape) = area shape 
pictureArea (Combine pic pic1) = pictureArea pic + pictureArea pic1
pictureArea (Rotate x pic) = pictureArea pic
pictureArea (Translate x y pic) = pictureArea pic

{-

λΠ> pictureArea testPicture
328.53981633974485 : Double

-}

safeDivide : Double -> Double -> Maybe Double
safeDivide x 0.0 = Nothing
safeDivide x y = Just (x / y)

data Tree elem = Empty | Node (Tree elem) elem (Tree elem)

%name Tree tree, tree1

insert : Ord elem => elem -> Tree elem -> Tree elem
insert x Empty = Node Empty x Empty
insert x orig@(Node left val right) = case compare x val of
                                      LT => Node (insert x left) val right
                                      EQ => orig
                                      GT => Node left val (insert x right)

data BSTree : Type -> Type where
  BSEmpty : Ord elem => BSTree elem
  BSNode : Ord elem => (left : BSTree elem) -> (val : elem) ->
                       (right : BSTree elem) -> BSTree elem
                       
insertBS : elem -> BSTree elem -> BSTree elem
insertBS x BSEmpty = BSNode BSEmpty x BSEmpty
insertBS x orig@(BSNode left val right)
      = case compare x val of
             LT => BSNode (insertBS x left) val right
             EQ => orig
             GT => BSNode left val (insertBS x right)
             
listToTree : Ord a => List a -> Tree a
listToTree [] = Empty
listToTree (x :: xs) = insert x (listToTree xs)

{-

λΠ> listToTree [1,4,3,5,2]
Node (Node Empty 1 Empty)
     2
     (Node (Node Empty 3 (Node Empty 4 Empty)) 5 Empty) : Tree Integer
λΠ> 

-}

treeToList : Tree a -> List a
treeToList Empty = []
treeToList (Node tree x tree1) = (treeToList tree) ++ [x] ++ (treeToList tree1)

{-

λΠ> treeToList (listToTree [4,1,8,7,2,3,9,5,6])
[1, 2, 3, 4, 5, 6, 7, 8, 9] : List Integer
λΠ> 

-}


