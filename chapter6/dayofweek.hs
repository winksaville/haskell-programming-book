module DayOfWeek where

data DayOfWeek =
    Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Ord, Show)

instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    (==) Sun Sun = True
    (==) _ _     = False

-- Making Friday the Best Day of the week
-- i.e. Fri is equal to Fri
--      Fri is GT all other days
--      All other days are LT Fri
--      Any other day are always equal
instance Ord DayOfWeek where
    compare Fri Fri = EQ
    compare Fri _ = GT
    compare _ Fri = LT
    compare _ _ = EQ

data Date =
    Date DayOfWeek Int deriving Show

instance Eq Date where
    (==) (Date weekDay dayOfMonth)
         (Date weekDay' dayOfMonth') =
            weekDay == weekDay' && dayOfMonth == dayOfMonth'
