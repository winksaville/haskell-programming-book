module Symmetry where

dropSpaces :: String -> String
dropSpaces s = dropWhile (== ' ') s

getWord :: String -> String
getWord s = takeWhile (/= ' ') (dropSpaces s)

dropWord :: String -> String
dropWord s = dropWhile (/= ' ') (dropSpaces s)

myWords :: String -> [String]
myWords s =
    let nextWord = getWord s
        remainingWords = dropWord s
    in  if (remainingWords == "") then
            if nextWord == "" then [] else [nextWord]
        else nextWord : myWords remainingWords
