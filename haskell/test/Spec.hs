import           Sorts.BeadSort   (beadSort)
import           Test.Tasty
import           Test.Tasty.HUnit

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Sorts.BeadSort Tests" [beadSortTests]

beadSortTests :: TestTree
beadSortTests = testGroup "BeadSort"
  [ testCase "Empty list" $
      beadSort [] @?= ([] :: [Int])
  , testCase "Already sorted list" $
      beadSort [1, 2, 3, 4, 5] @?= [1, 2, 3, 4, 5]
  , testCase "Reverse sorted list" $
      beadSort [5, 4, 3, 2, 1] @?= [1, 2, 3, 4, 5]
  , testCase "List with duplicates" $
      beadSort [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5] @?= [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
  , testCase "List with a single element" $
      beadSort [42] @?= [42]
  , testCase "Mixed numbers" $
      beadSort [0, 5, 2, 8, 1, 0, 3] @?= [0, 0, 1, 2, 3, 5, 8]
  ]
-- Note: Testing the error case for negative numbers with tasty-hunit
-- typically involves `assertRaises` or a similar mechanism, which can be added
-- if you want to explicitly test for that exception.
-- For example:
--   testCase "Negative numbers (should error)" $
--     assertRaises (assertEqual "Should throw error for negative numbers") anyError (beadSort [-1, 2])
-- where anyError is a selector for the expected error.
