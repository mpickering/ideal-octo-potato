{-# LANGUAGE CPP #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

{-# OPTIONS_GHC -ddump-ds -ddump-to-file -dverbose-core2core -ddump-simpl -dsuppress-module-prefixes -dsuppress-coercions -dsuppress-uniques -dsuppress-ticks -ddump-inlinings #-}
--{-# OPTIONS_GHC -dsuppress-idinfo #-}
#ifdef BAD
{-# OPTIONS_GHC -funfolding-use-threshold=136 -dumpdir dumps-9.0.1-136 #-}
#else
{-# OPTIONS_GHC -funfolding-use-threshold=140 -dumpdir dumps-9.0.1-140 #-}
#endif


module Main (main) where

import Foreign.C.Types
import Bench

import System.Random.Stateful


seed :: Int
seed = 1337

main :: IO ()
main = do
  let !sz = 1000000
  let !gen = mkStdGen seed
  bench "CInt" $ nf (genMany (uniformR (minBound @CInt, pred (maxBound @CInt))) gen) sz

genMany :: (g -> (a, g)) -> g -> Int -> a
genMany f g0 n = go 0 $ f g0
  where
    go i (!y, !g)
      | i < n = go (i + 1) $ f g
      | otherwise = y
