main :: IO ()
main = do
  putStrLn . show $ (solveRPN "1 2 +") == 3
  putStrLn . show $ (solveRPN "1 2 3 * +") == 7
  putStrLn . show $ (solveRPN "2.7 ln") == 0.9932517730102834
  putStrLn . show $ (solveRPN "10 10 10 10 sum") == 40
  putStrLn . show $ (solveRPN "10 10 10 10 sum 4 /") == 10
  putStrLn . show $ (solveRPN "10 2 ^") == 100.0

solveRPN :: String -> Double
solveRPN = head . foldl func [] . words
  where func (x:y:ys) "*" = (y * x):ys
        func (x:y:ys) "+" = (y + x):ys
        func (x:y:ys) "-" = (y - x):ys
        func (x:y:ys) "/" = (y / x):ys
        func (x:y:ys) "^" = (y ** x):ys
        func (x:xs) "ln"  = log x:xs
        func xs "sum" = [sum xs]
        func xs numberString = read numberString:xs
