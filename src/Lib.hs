module Lib
    ( someFunc,
      Outcome(Outcome, name, odds),
      winAmount,
      Bin(Bin,bins)
    ) where

import Data.Set (Set)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data Outcome = Outcome { name :: String
  ,odds :: Integer } deriving (Show, Eq, Ord)

data Bin = Bin { bins :: Set Outcome } deriving (Show, Eq)

winAmount :: Outcome -> Integer -> Integer
winAmount outcome wager = wager * odds outcome


