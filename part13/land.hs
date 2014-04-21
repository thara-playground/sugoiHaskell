type Birds = Int
type Pole = (Birds, Birds)

-- landLeft :: Birds -> Pole -> Pole
-- landLeft n (left, right) = (left + n, right)

-- landRight :: Birds -> Pole -> Pole
-- landRight n (left, right) = (left, right + n)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (left - (right + n)) < 4 = Just (left, right + n)
    | otherwise                    = Nothing

x -: f = f x

banana :: Pole -> Maybe Pole
banana _ = Nothing

-- return (0,0) >>= landLeft 1 >>= landRight 4 >>= landLeft 2 >>= landLeft 1
routine :: Maybe Pole
routine = case landLeft 1 (0,0) of
    Nothing -> Nothing
    Just pole1 -> case landRight 4 pole1 of
        Nothing -> Nothing
        Just pole2 -> case landLeft 2 pole2 of
            Nothing -> Nothing
            Just pole3 -> landLeft 1 pole3
