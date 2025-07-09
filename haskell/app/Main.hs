module Main where

import           Sorts.BeadSort (beadSort)


main :: IO ()
main = do
  putStrLn "Enter a list of non-negative integers separated by spaces:"
  input <- getLine
  let numbers = map read $ words input :: [Int]
  if any (< 0) numbers
    then putStrLn "Error: Bead sort only works with non-negative integers."
    else do
      let sorted = beadSort numbers
      putStrLn $ "Sorted list: " ++ show sorted
