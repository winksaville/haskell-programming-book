module Sing where

fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing :: [Char] -> [Char]
sing firstWord
    | firstWord == "Singin"    = fstString firstWord
    | firstWord == "Somewhere" = sndString firstWord
    | otherwise                =  "I don't know the song"
