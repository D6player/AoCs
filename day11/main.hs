import Data.List (transpose)
import Data.List.Split (splitOn)

parseInput s = zip [0 ..] s >>= parseLine

parseLine (x, line) =
  map ((x,) . fst) $
    filter (('#' ==) . snd) $
      zip [0 ..] line

test =
  "...#......\n\
  \.......#..\n\
  \#.........\n\
  \..........\n\
  \......#...\n\
  \.#........\n\
  \.........#\n\
  \..........\n\
  \.......#..\n\
  \#...#....."

expandUniverse s = transpose (transpose (splitOn "\n" s >>= helper) >>= helper)
  where
    helper s
      | filter ('.' /=) s == "" = [s, s]
      | otherwise = [s]

calculateDistances :: (Eq a, Num a) => [(a, a)] -> [[a]]
calculateDistances x = tail $ splitOn [0] (x >>= helper)
  where
    helper y = fmap (distance y) x
    distance (y0, y1) (x0, x1) = abs (y1 - x1) + abs (y0 - x0)

-- >>> calculateDistances $ parseInput $ expandUniverse test
-- [[],[6,6,9,9,15,15,15,12,6],[10,5,13,9,9,19,14,6,10],[11,5,17,17,9,14,9,5,11],[8,6,6,14,9,9,13,5,8],[12,12,6,9,15,9,17,6,12],[6,16,11,15,9,17,6,12,6],[10,5,15,19,9,14,6,16,10],[5,12,14,14,9,9,11,5,5],[]]
