module Sing where

fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing :: [Char] -> [Char]
sing "Singin" = fstString "Singin"
sing "Somewhere" = sndString "Somewhere"
sing _ = "I don't know the song"
