module Ex1

hello : IO ()
hello = putStrLn "Hello, Idris world!"

{-

hole : IO ()            λΠ> :t hole
hole =             hole : IO ()

-}

char : IO ()
char = putStrLn (cast 'x') -- convert : Char -> String
                           
stringOrBool : Bool -> Type
stringOrBool True = Int
stringOrBool False = String

getStringOrInt : (x : Bool) -> stringOrBool x
getStringOrInt False = "Forty two"
getStringOrInt True = 42

valToString : (x : Bool) -> stringOrBool x -> String
valToString False y = y
valToString True y = cast y

{-

λΠ> valToString False "42"
"42" : String
λΠ> valToString True 42
"42" : String

-}

||| Calculate the average length of words in a string.
average : (s : String) -> Double
average s = let numWords = wordCount s
                totalLen = sum (allLen (words s)) in
                cast totalLen / cast numWords
  where 
    wordCount : String -> Nat
    wordCount s = length $ words s 
    
    allLen : List String -> List Nat
    allLen s = map length s
    
showAverage : String -> String
showAverage s = show (average s) ++ "\n"

showAverageRepl : IO ()
showAverageRepl = repl "Enter a string: " showAverage

{-

λΠ> the Bool
id : Bool -> Bool

-}

-- vvv The export keyword means that the definition of function is exported from the module
--       vvv Interfaces aka typeclasses
export
double : Num a => a -> a
double x = x + x

{-

λΠ> :t \x : Int, y : Int => x + y
\x, y => x + y : Int -> Int -> Int

-}

{-

Semantic highlighting:

  Types are blue.
  Values (more precisely, data constructors) are red.
  Functions are green.
  Variables are magenta.
  
-}

{-

λΠ> []
(input):Can't infer argument elem to [] -- Idris doesn’t know what the element type should be

λΠ> the (List Int) []
[] : List Int

-}

{-

λΠ> :doc average
Ex1.average : (s : String) -> Double
    Calculate the average length of words in a string.
    
    The function is Total
    
-}

-- Write a palindrome function, of type String -> Bool, 
-- that returns whether the input reads the same backwards as forwards.

palindrome : Nat -> String -> Bool
palindrome len str =
  let s = toLower str in 
    s == reverse s && length s > len

-- Write a counts function of type String -> (Nat, Nat) that returns a pair of the number of words 
-- in the input and the number of characters in the input.

counts : String -> (Nat, Nat)
counts s = (wLen, cLen)
  where wLen = length $ words s
        cLen = length s

-- Write a top_ten function of type Ord a => List a -> List a 
-- that returns the ten larg- est values in a list. 

topTen : Ord a => List a -> List a
topTen xs = take 10 $ reverse $ sort xs

-- Write an over_length function of type Nat -> List String -> Nat 
-- that returns the number of strings in the list longer than the given number of characters.

overLength : Nat -> List String -> Nat
overLength k xs = length $ filter (> k) $ map length xs


