import Control.Monad

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)
data Crumb a = LeftCrumb a (Tree a) | RightCrumb a (Tree a) deriving (Show)

type Breadcrumbs a = [Crumb a]

freeTree :: Tree Char
freeTree =
  Node 'P'
    (Node 'O'
      (Node 'L'
        (Node 'N' Empty Empty)
        (Node 'T' Empty Empty)
      )
      (Node 'Y'
        (Node 'S' Empty Empty)
        (Node 'A' Empty Empty)
      )
    )
    (Node 'L'
      (Node 'W'
        (Node 'C' Empty Empty)
        (Node 'R' Empty Empty)
      )
      (Node 'A'
        (Node 'A' Empty Empty)
        (Node 'C' Empty Empty)
      )
    )


x -: f = f x

type Zipper a = (Tree a, Breadcrumbs a)

goLeft :: Zipper a -> Maybe (Zipper a)
goLeft (Node x l r, bs) = Just (l, LeftCrumb x r:bs)
goLeft (Empty, _) = Nothing


goRight :: Zipper a -> Maybe (Zipper a)
goRight (Node x l r, bs) = Just (r, RightCrumb x l:bs)
goRight (Empty, _) = Nothing


goUp :: Zipper a -> Maybe (Zipper a)
goUp (t, LeftCrumb x r:bs) = Just (Node x t r, bs)
goUp (t, RightCrumb x l:bs) = Just (Node x l t, bs)
goUp (_, []) = Nothing
