module Sorts.BeadSort (beadSort) where

import           Data.List (transpose)

-- Bead sort: only for non-negative integers
beadSort :: [Int] -> [Int]
beadSort [] = []
beadSort xs
  | any (< 0) xs = error "Bead sort only works with non-negative integers"
  | otherwise    = map countBeads $ transpose $ gravityBeads $ transpose $ beadMatrix xs

-- Convert numbers into a bead matrix
beadMatrix :: [Int] -> [[Bool]]
beadMatrix xs = map (\x -> replicate x True ++ replicate (maxVal - x) False) xs
  where maxVal = maximum xs

-- Simulate gravity: rotate and let beads fall (True values go to bottom)
gravityBeads :: [[Bool]] -> [[Bool]]
gravityBeads = map fall
  where
    fall col = replicate zeros False ++ replicate ones True
      where
        ones = length $ filter id col
        zeros = length col - ones

-- Count beads (number of True values in a row)
countBeads :: [Bool] -> Int
countBeads = length . filter id
