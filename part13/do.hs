-- Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
-- Nothing >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
-- Just 3 >>= (\x -> Nothing >>= (\y -> Just (show x ++ y)))
-- Just 3 >>= (\x -> Just "!" >>= (\y -> Nothing))
--

foo :: Maybe String
foo = Just 3   >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))

foo' :: Maybe String
foo' = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)
