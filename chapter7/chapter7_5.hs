module Chapter7_5 where

fSub = flip (-)

flip' :: (a -> b -> c) -> b -> a -> c
flip' f a b = f b a

myFlip :: (a -> b -> c) -> b -> a -> c
myFlip f = \ x y -> f y x

returnLast' :: a -> (b -> (c -> (d -> d)))
returnLast' _ _ _ d = d

--returnBroke :: (((a -> b) -> c) -> d) -> d
--returnBroke _ _ _ d = d

returnAfterApply :: (a -> b) -> a -> c -> b
returnAfterApply f a c = f a

data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' =
    putStrLn $ show e ++ " is the boss of " ++ show e'

employeeRank ::
    (Employee -> Employee -> Ordering)
        -> Employee -> Employee -> IO ()
employeeRank f e e' =
    case f e e' of
    GT -> reportBoss e e'
    LT -> (flip reportBoss) e e'
    EQ -> putStrLn "Neither employee is the boss"

codersRule :: Employee -> Employee -> Ordering
codersRule Coder Coder = EQ
codersRule Coder _ = GT
codersRule _ Coder = LT
codersRule e e' = compare e e'

wink = Coder
yvette = CEO
