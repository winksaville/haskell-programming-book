module PoemLines where

dropChars :: Char -> String -> String
dropChars ch s = dropWhile (== ch) s

getUntil :: Char -> String -> String
getUntil ch s = takeWhile (/= ch) (dropChars ch s)

dropUntil :: Char -> String -> String
dropUntil ch s = dropWhile (/= ch) (dropChars ch s)

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could fram thy fearful symetry?"

sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen
sentencesWithBlankLines =
    "\n" ++ firstSen ++ secondSen ++ "\n\n" ++ thirdSen ++ fourthSen ++ "\n\n"

shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forests of the night"
    , "What immortal hand or eye"
    , "Could fram thy fearful symetry?"
    ]


myLines :: String -> [String]
myLines s =
    let next = getUntil '\n' s
        remaining = dropUntil '\n' s
    in  if (remaining == "") then
            if next == "" then [] else [next]
        else next : myLines remaining
