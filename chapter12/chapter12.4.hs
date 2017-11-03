module Ch12_4 where


data Example a = Blah | RoofGoats | Woot a

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:[]) = Nothing
safeTail (_:xs) = Just xs

data Trivial = Trivial

data Unary a = Unary a

data TwoArgs a b = TwoArgs a b

data ThreeArgs a b c = ThreeArgs a b c

data UnaryC = UnaryC Int deriving Show
