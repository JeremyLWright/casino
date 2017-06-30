import Lib

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)


main :: IO ()
main = hspec $ do
  describe "Outcome Type" $ do
    it "Same values of two outcome types are equivelent" $ do
      Outcome "Any Craps" 8 == Outcome "Any Craps" 8 `shouldBe` (True)

    it "Different values of two outcome types are not equivelent" $ do
      Outcome "Any Craps" 9 == Outcome "Any Craps" 8 `shouldBe` False
    
    it "winAmount computes all my monies" $
      property $ \wager factor -> winAmount (Outcome "_" factor) wager == (wager * factor)

