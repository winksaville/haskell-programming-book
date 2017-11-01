module Xx where

data Person =
    MkPerson String Int
    deriving (Eq, Show)

data PersonRec =
    MkPersonRec { name :: String
              , age :: Int }
              deriving (Eq, Show)

jm = MkPersonRec "Julie" 108
ca = MkPersonRec "chris" 16
