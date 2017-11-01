module ConstructingDestructing where

data GuessWhat = Chickenbutt deriving (Eq, Show)

data Id a = MkId a deriving (Eq, Show)

data Product a b = Product a b deriving (Eq, Show)

data Sum a b = First a | Second b deriving (Eq, Show)

data RecordProduct a b =
    RecordProduct
        { pfirst :: a
        , psecond :: b }
        deriving (Eq, Show)

-- Sum and Product
newtype NumCow = NumCow Int deriving (Eq, Show)
newtype NumPig = NumPig Int deriving (Eq, Show)
data Farmhouse = Farmhouse NumCow NumPig deriving (Eq, Show)
type Framhouse' = Product NumCow NumPig

newtype NumSheep = NumSheep Int deriving (Eq, Show)

data BigFarmhouse = BigFarmhouse NumCow NumPig NumSheep deriving (Eq, Show)
type BigFarmhouse' = Product NumCow (Product NumPig NumSheep)

type Name = String
type Age = Int
type LovesMud = Bool
type PoundsOfWool = Int

data CowInfo = CowInfo Name Age deriving (Eq, Show)
data PigInfo = PigInfo Name Age LovesMud deriving (Eq, Show)
data SheepInfo = SheepInfo Name Age PoundsOfWool deriving (Eq, Show)

data Animal =
      Cow CowInfo
    | Pig PigInfo
    | Sheep SheepInfo

type Animal' =
    Sum CowInfo (Sum PigInfo SheepInfo)

bess' = (CowInfo "Bess" 4)
bess = First bess' :: Animal'

e' = Second (SheepInfo "Elmer" 5 5)
elmer = Second e' :: Animal'

elmo' = Second (SheepInfo "Elmo" 7 8)
--elmo = First elmo' :: Animal' -- Error "Couldn't match type 'Sum a0 SheepInfo' with 'CowInfo'
elmo = Second elmo' :: Animal' -- OK

sheep = SheepInfo "Baaaa" 9 10


-- Constructing values

trivialValue :: GuessWhat
trivialValue = Chickenbutt

idInt :: Id Integer
idInt = MkId 10

type Awesome = Bool

person :: Product Name Awesome
person = Product "Simon" True

data Twitter = Twitter deriving (Eq, Show)
data AskFm = AskFm deriving (Eq, Show)

socialNetwork :: Sum Twitter AskFm
socialNetwork = First Twitter

myRecord :: RecordProduct Integer Float
myRecord = RecordProduct
    {
      pfirst = 42
    , psecond = 0.00001 }

data OperatingSystem =
      GnuPlusLinux
    | OpenBSDPlusNevermindJustBSDStill
    | Mac
    | Windows
    deriving (Eq, Show)

data ProgLang =
      Haskell
    | Agda
    | Idris
    | PureScript
    deriving (Eq, Show)

-- For record types using MkXxxx seems for type Xxxx seems a good idiom
data Programmer =
    MkProgrammer { os :: OperatingSystem
               , lang :: ProgLang }
    deriving (Eq, Show)

nineToFive :: Programmer
nineToFive = MkProgrammer {
      os = Mac
    , lang = Haskell
}

-- Using records allow you to reoder the parameters to the data constructor
feelingWizardly :: Programmer
feelingWizardly =
    MkProgrammer {
      lang = Agda
    , os = GnuPlusLinux }

-- Exercise: Programmers
allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [ GnuPlusLinux
  , OpenBSDPlusNevermindJustBSDStill
  , Mac
  , Windows
  ]

allLanguages :: [ProgLang]
allLanguages =
  [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = undefined -- SKIPPING for now

-- Accidental bottoms from records, the following generates a warning.
-- Heed the warning and DONOT do this!!!
--partialAf = MkProgrammer {os = GnuPlusLinux}

-- Destructing values

newtype FarmerName = Name String deriving Show
newtype Acres = Acres Int deriving Show

-- FarmerType is a Sum
data FarmerType = DairyFarmer
                | WheatFarmer
                | SoybeanFarmer
                deriving Show

data Farmer =
    Farmer FarmerName Acres FarmerType
    deriving Show

isDairyFarmer :: Farmer -> Bool
isDairyFarmer (Farmer _ _ DairyFarmer) = True
isDairyFarmer _ = False

data FarmerRec =
    MkFarmerRec {
          name :: FarmerName
        , acres :: Acres
        , farmerType :: FarmerType }
    deriving Show

isDairyFarmerRec :: FarmerRec -> Bool
isDairyFarmerRec farmerRec =
    case farmerType farmerRec of
        DairyFarmer -> True
        _ -> False

f1 = MkFarmerRec {farmerType = DairyFarmer, name = Name "Wink", acres = Acres 14}
