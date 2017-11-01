module PityTheBool where

import Data.Int

-- 1. Big is a Bool with cardinality 2 
--    Small is a Bool with cardinality 2
--    BigSmall has cardinality of 2 + 2 = 4
data BigSmall = Big Bool | Small Bool deriving (Eq, Show)

-- 2. Numba is Int8 with cardinality 256
--    BoolyBool is Bool with cardinality 2
--    NumberOrBool has cardinality of 256 + 2 = 258
data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)

