import Control.Monad

(.) :: (b -> c) -> (a -> b) -> (a -> c)
f . g = (\x -> f (g x))

(<=<<) :: (Monad m) => (b -> m c) -> (a -> m b) -> (a -> m c)
f <=<< g = (\x -> g x >>= f)
