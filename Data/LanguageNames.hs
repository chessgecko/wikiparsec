-- This file is automatically generated using `scripts/make_language_table.py`.

module Data.LanguageNames where
import Data.LanguageNamesData
import Data.ByteString (ByteString)
import Data.List.Split (splitOn)
import Data.List (intercalate)
import qualified Data.Map as Map
import qualified Data.ByteString.Char8 as Char8
import qualified Data.ByteString.UTF8 as UTF8

unknownCode :: String -> String
unknownCode name =
  concat [
    "und-x-",
    intercalate "-" (splitOn " " name)]

lookupLanguage :: ByteString -> ByteString -> ByteString
lookupLanguage code name = UTF8.fromString $
  lookupLanguageStr (UTF8.toString code) (UTF8.toString name)

lookupLanguageStr :: String -> String -> String
lookupLanguageStr "fr" "conv" = "mul"
lookupLanguageStr "fr" name = name
lookupLanguageStr "en" "Translingual" = "mul"
lookupLanguageStr lang name =
  Map.findWithDefault (unknownCode name) (lang, name) languageMap

entryTuple :: String -> ((String, String), String)
entryTuple line =
  let entry = splitOn "," line
      lang  = entry !! 0
      name  = entry !! 1
      code  = entry !! 2
  in ((lang, name), code)

languageMap :: Map.Map (String, String) String
languageMap = Map.fromList (map entryTuple (lines languageData))
