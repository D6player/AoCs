getCalibration = read . helper . filter (`elem` ['0' .. '9'])
  where
    helper x = head x : last x : ""

getResult = sum . map getCalibration . lines

main = getContents >>= print . getResult
