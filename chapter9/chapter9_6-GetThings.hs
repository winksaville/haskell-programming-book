module GetThings where

dropChars :: Char -> String -> String
dropChars ch s = dropWhile (== ch) s

getUntil :: Char -> String -> String
getUntil ch s = takeWhile (/= ch) (dropChars ch s)

dropUntil :: Char -> String -> String
dropUntil ch s = dropWhile (/= ch) (dropChars ch s)

mySplit :: Char -> String -> [String]
mySplit ch s =
    let next = getUntil ch s
        remaining = dropUntil ch s
    in  if (remaining == "") then
            if next == "" then [] else [next]
        else next : mySplit ch remaining

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

testWords = "abc def ghi"
testWordsWithBlanks = " abc   def ghi  "
testWordsResults = ["abc", "def", "ghi"]

myWords :: String -> [String]
myWords s = mySplit ' ' s

myLines :: String -> [String]
myLines s = mySplit '\n' s

main :: IO ()
main = do
    print $ "Are sentences equal? " ++ show (myLines sentences == shouldEqual)
    print $ "Are sentences equal? "
        ++ show (myLines sentencesWithBlankLines == shouldEqual)
    print $ "Are words equal? " ++ show (myWords testWords == testWordsResults)
    print $ "Are words equal? " ++
        show (myWords testWordsWithBlanks == testWordsResults)
