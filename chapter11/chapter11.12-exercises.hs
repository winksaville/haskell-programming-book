module HowDoesYourGardenGrow where

data FictionType = FictionValue deriving Show
data NonfictionType = NonfictionValue deriving Show

data BookType = FictionBook FictionType
              | NonfictionBook NonfictionType
              deriving Show

type AuthorName = String

data AuthorType = Author (AuthorName, BookType)

-- The normal form of AuthorType
data AuthorTypeNF =
      Fiction AuthorName
    | Nonfiction AuthorName
    deriving (Eq, Show)


data Expr =
      Number Int
    | Minus Expr
    | Add Expr Expr
    | Mult Expr Expr
    | Divide Expr Expr
    deriving Show

-- 1. GardenNF is the normal form below, I think :)
data FlowerType =
      Gardenia
    | Daisy
    | Rose
    | Lilac
    deriving Show

type Gardener = String

data Garden = Garden Gardener FlowerType deriving Show

data GardenNF =
      GardeniaGarden Gardener
    | DiaisyGarden Gardener
    | RoseGarden Gardener
    | LilacGarden Gardener
