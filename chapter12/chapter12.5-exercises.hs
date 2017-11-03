module Ch12_5_Exercises where

-- 1. 'a' in id :: a -> a must be concrete type and thus it's kind is '*' (probably Wrong)

-- 2. It seems 'a' must be a concrete type and kind is '*'
--    and 'f' kind is '* -> *'. (probably Wrong)
r :: a -> f a
r = undefined

-- String Processing

-- 1. Not explicitly recursive and isThe is better returning Bool
isThe :: String -> Bool
isThe s = s == "the"

replaceThe :: String -> String
replaceThe s = unwords (map (\x -> if isThe x then x else "a") $ words s)

-- 2.
isVowel :: Char -> Bool
isVowel 'a' = True
isVowel 'e' = True
isVowel 'i' = True
isVowel 'o' = True
isVowel 'u' = True
isVowel _ = False

beginsWithVowel :: String -> Bool
beginsWithVowel [] = False
beginsWithVowel (x:_) = isVowel x

-- Always returns two words but one or both maybe empty
wordPair :: [String] -> [String]
wordPair [] = ["", ""]
wordPair (w:[]) = [w, ""]
wordPair (w:ws) = [w, head ws]

countTheBeforeVowel' :: [String] -> Int -> Int
countTheBeforeVowel' [] n = n
countTheBeforeVowel' ws n =
    let aPair = wordPair ws
        firstWord = head aPair
        secondWord = last aPair
        remainder = drop 1 ws
    in  countTheBeforeVowel' remainder
            (if isThe firstWord && beginsWithVowel secondWord then n + 1 else n)

countTheBeforeVowel :: String -> Int
countTheBeforeVowel ws = countTheBeforeVowel' (words ws) 0

-- 3.
countVowels :: String -> Int
countVowels s = countVowels' s 0 where 
        countVowels' :: String -> Int -> Int
        countVowels' [] n = n
        countVowels' (c:cs) n = countVowels' cs $ if (isVowel c) then n + 1 else n


-- Skipping the rest for now
