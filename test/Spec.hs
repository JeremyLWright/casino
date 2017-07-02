import Lib

import Test.Tasty
import Test.Tasty.QuickCheck as QC
import Test.Tasty.SmallCheck as SC
import Test.Tasty.HUnit


main :: IO ()
main = defaultMain tests


tests :: TestTree
tests = testGroup "Tests" [properties, unitTests]

properties :: TestTree
properties = testGroup "Properties" [qcProps, scProps]

qcProps = testGroup "(checked by QuickCheck)"
  [ QC.testProperty "Outcome is equal to the factor times wager" $
      \wager factor -> winAmount (Outcome "_" factor) wager == (wager * factor)]

scProps = testGroup "(checked by SmallCheck)"
  [ SC.testProperty "Outcome is equal to the factor times wager" $
      \wager factor -> winAmount (Outcome "_" factor) wager == (wager * factor)
  ]

unitTests = testGroup "Unit Tests"
  [ testCase "Same values of two outcome types are equivelent" $
      Outcome "Any Craps" 8 == Outcome "Any Craps" 8 @?= (True)

  , testCase  "Different values of two outcome types are not equivelent" $
      Outcome "Any Craps" 9 == Outcome "Any Craps" 8 @?= False
  ]

