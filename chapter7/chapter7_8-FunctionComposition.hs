module FunctionComposition where

f x = take 5 . enumFrom $ x

fodd from count = take count . filter odd . enumFrom $ from

-- With composition
fltr :: (Enum a) => (a -> Bool) -> a -> Int -> [a]
fltr f from count = take count . filter f . enumFrom $ from

-- With parens
fltr' :: (Enum a) => (a -> Bool) -> a -> Int -> [a]
fltr' f from count = take count (filter f ( enumFrom from))
