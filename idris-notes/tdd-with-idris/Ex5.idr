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




