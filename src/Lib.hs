module Lib
    ( someFunc,
      Outcome(Outcome, name, odds),
      winAmount
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data Outcome = Outcome { name :: String
  ,odds :: Integer } deriving (Show, Eq)

winAmount :: Outcome -> Integer -> Integer
winAmount outcome wager = wager * odds outcome

