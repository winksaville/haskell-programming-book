data Size = Engines Integer deriving (Eq, Show)

data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited
    deriving (Eq, Show)

data Vechicle = Car Manufacturer Price | Plane Airline Size deriving (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir (Engines 4)

-- 1. :t myCar
-- myCar :: Vechicle


-- 2.
isCar :: Vechicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vechicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vechicle] -> [Bool]
areCars cars = map isCar cars

-- 3.
getManu :: Vechicle -> Manufacturer
getManu (Car manu _) = manu

-- 4. Exception occurs if not a Car

-- 5. Add size as a parameter to plane
getSize :: Vechicle -> Size
getSize (Plane _ engines) = engines
getSize _ = Engines 0
