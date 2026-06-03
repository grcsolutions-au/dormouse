{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}

module Dormouse.Url.Class 
  ( IsUrl(..)
  ) where

import Dormouse.Url.Types

class (Eq url, Show url) => IsUrl url where
  asAnyUrl :: url -> AnyUrl
  mapIsUrl :: (forall scheme. Url scheme -> Url scheme) -> url -> url

instance IsUrl (Url scheme) where
  asAnyUrl = AnyUrl
  mapIsUrl = id

instance IsUrl AnyUrl where
  asAnyUrl (AnyUrl u) = asAnyUrl u
  mapIsUrl f (AnyUrl u) = AnyUrl $ mapIsUrl f u

