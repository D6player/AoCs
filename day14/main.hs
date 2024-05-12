import Data.HashMap (empty, insert, lookup, member)
import Data.List (sortBy)
import Data.Set (fromList, member)

-- PARSING
parseLineFor c (y, line) = map ((,y) . fst) $ filter ((== c) . snd) $ zip [0 ..] line

parseInputFor c s = zip [0 ..] (lines s) >>= parseLineFor c

parseInput s = (parseInputFor 'O' s, parseInputFor '#' s, width, height)
  where
    height = length $ lines s
    width = length $ head $ lines s

-- MOVING
addY (x, y) = (x, y + 1)

addX (x, y) = (x + 1, y)

subY (x, y) = (x, y - 1)

subX (x, y) = (x - 1, y)

-- moveUp (os, rs, w, h) = (map newXYFor os, rs, w, h)
--   where
--     osSet = fromList os
--     rsSet = fromList rs
--     newXYFor (x, y)
--       | (x, y) `member` rsSet = (x, y + 1)
--       | y == 0 = (x, 0)
--       | (x, y - 1) `member` osSet = addY $ newXYFor (x, y - 1)
--       | otherwise = newXYFor (x, y - 1)

move :: ((Int, Int) -> (Int, Int)) -> ((Int, Int) -> (Int, Int)) -> ((Int, Int) -> Int -> Int -> Bool) -> ([(Int, Int)], [(Int, Int)], Int, Int) -> ([(Int, Int)], [(Int, Int)], Int, Int)
move addC subC atLim (os, rs, w, h) = (map newXYFor os, rs, w, h)
  where
    osSet = fromList os
    rsSet = fromList rs
    newXYFor cords
      | cords `Data.Set.member` rsSet = addC cords
      | atLim cords w h = cords
      | subC cords `Data.Set.member` osSet = addC $ newXYFor (subC cords)
      | otherwise = newXYFor (subC cords)

moveUp = move addY subY (\(x, y) w h -> y == 0)

moveDown = move subY addY (\(x, y) w h -> y == h - 1)

moveLeft = move addX subX (\(x, y) w h -> x == 0)

moveRight = move subX addX (\(x, y) w h -> x == w - 1)

getNorthLoad (os, rs, w, h) = sum $ map ((h -) . snd) os

-- PART 2
doTheCycle = moveRight . moveDown . moveLeft . moveUp

doTheDance stateMap iteration dish
  | dish `Data.HashMap.member` stateMap = (Data.HashMap.lookup dish stateMap, iteration)
  | iteration == 10000 = error ":|"
  | otherwise = doTheDance (insert dish iteration stateMap) (iteration + 1) (doTheCycle dish)

main = getContents >>= print . doTheDance empty 0 . parseInput

-- main = getContents >>= print . getNorthLoad . foldl (.) id (map (const doTheCycle) [1 .. 230]) . parseInput
