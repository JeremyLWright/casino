module Lib
    ( someFunc,
      Outcome(Outcome)
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data Outcome = Outcome { name :: String
			,odds :: Integer } deriving (Show, Eq)

			
