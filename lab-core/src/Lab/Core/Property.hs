-------------------------------------------------------------------
-- |
-- Module       : Lab.Core.Property
-- Copyright    : (C) 2015
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-------------------------------------------------------------------
module Lab.Core.Property (
    -- * Operators
        (.>.)
    ,   (.>=.)
    ,   (.<.)
    ,   (.<=.)
    -- * Functions
    ,   failWith
    ,   pass
    ) where

import qualified Data.Text as T

import Test.QuickCheck ( Property, counterexample )

import Preamble

infix 4 .>.

(.>.) :: (Ord a, Show a) => a -> a -> Property
x .>. y = counterexample (join [show x, " <= ", show y]) (x > y)

(.>=.) :: (Ord a, Show a) => a -> a -> Property
x .>=. y = counterexample (join [show x, " < ", show y]) (x >= y)

(.<.) :: (Ord a, Show a) => a -> a -> Property
x .<. y = counterexample (join [show x, " >= ", show y]) (x < y)

(.<=.) :: (Ord a, Show a) => a -> a -> Property
x .<=. y = counterexample (join [show x, " > ", show y]) (x <= y)

pass :: Property
pass = counterexample "" True

failWith :: T.Text -> Property
failWith t = counterexample (T.unpack t) False
