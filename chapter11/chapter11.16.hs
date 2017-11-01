module ListsArePolymorphic where

-- Our own List type defined recursively so it has an unlimited number of elements
data List a = Nil | Cons a (List a) deriving Show

-- An empty list :type nil is "nil :: List a"
nil = Nil

-- A one item list
oneItem = Cons "OneItem" Nil

-- two item list
twoItem = (Cons "first item" (Cons "second item" Nil))
twoItem' = Cons "first item" (Cons "second item" Nil)
