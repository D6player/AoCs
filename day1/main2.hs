{-# LANGUAGE OverloadedStrings #-}

import Data.Text (pack, replace, unpack)

normaliseLine = unpack . flip (foldr (uncurry replace)) m . pack
  where
    m = [("one", "1"), ("two", "2"), ("three", "3"), ("four", "4"), ("five", "5"), ("six", "6"), ("seven", "7"), ("eight", "8"), ("nine", "9"), ("zero", "0")]

getCalibration = read . helper . filter (`elem` ['0' .. '9'])
  where
    helper x = head x : last x : ""

getResult = sum . map (getCalibration . normaliseLine) . lines

main = getContents >>= print . getResult
