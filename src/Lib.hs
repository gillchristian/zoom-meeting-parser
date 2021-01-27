{-# LANGUAGE NamedFieldPuns #-}

module Lib where

import Data.List (intercalate)
import System.Exit (die)
import System.IO (hPutStrLn, stderr)
import Text.Parsec as P
import Text.Parsec.String as P

someFunc :: IO ()
someFunc = do
  result <- P.parse meeting "clipboard" <$> getContents
  case result of
    Left _ -> die "Could not parse Zoom meeting inviation.\n\nDid you forget to copy i?"
    Right meeting' -> do
      hPutStrLn stderr "Zoom meeting inviation parsed succesfully :)"
      print meeting'

data Meeting = Meeting
  { title :: String,
    time :: String,
    link :: String,
    meetingId :: String,
    password :: String
  }

instance Show Meeting where
  show Meeting {title, time, link, meetingId, password} =
    intercalate
      "\n"
      [ "**" <> title <> "**",
        "Horario: " <> time',
        "",
        "Link de la reunión:",
        link,
        "",
        "ID de la reunión: " <> meetingId,
        "Contraseña: " <> password
      ]
    where
      translate (x : xs) = toSpanishMonth x : xs
      time' = unwords $ translate $ words time

toSpanishMonth :: String -> String
toSpanishMonth "Jan" = "Enero"
toSpanishMonth "Feb" = "Febrero"
toSpanishMonth "Mar" = "Marzo"
toSpanishMonth "Apr" = "Abril"
toSpanishMonth "May" = "Mayo"
toSpanishMonth "Jun" = "Junio"
toSpanishMonth "Jul" = "Julio"
toSpanishMonth "Aug" = "Agosto"
toSpanishMonth "Sep" = "Septiembre"
toSpanishMonth "Oct" = "Octubre"
toSpanishMonth "Nov" = "Noviembre"
toSpanishMonth "Dec" = "Diciembre"

{-

    John Doe is inviting you to a scheduled Zoom meeting.

    Topic: Some topic
    Time: Jan 22, 2021 09:30 PM Amsterdam

    Join Zoom Meeting
    https://us02web.zoom.us/j/00000000000?pwd=xxxxxxxxx

    Meeting ID: 999 9999 9999
    Passcode: 000000
    One tap mobile
    +99999999999,,99999999999#,,,,*777777# US (New York)
    +99999999999,,99999999999#,,,,*777777# US (Washington D.C)

    Dial by your location
            +1 000 000 0000 US (New York)
            +1 000 000 0000 US (Washington D.C)
            +1 000 000 0000 US (Chicago)
            +1 000 000 0000 US (San Jose)
            +1 000 000 0000 US (Tacoma)
            +1 000 000 0000 US (Houston)
    Meeting ID: 999 9999 9999
    Passcode: 999999
    Find your local number: https://us02web.zoom.us/u/xxxxxxxxxx

-}

meeting :: P.Parser Meeting
meeting =
  Meeting
    <$> (P.manyTill P.anyChar (P.try $ P.string "Topic: ") *> line)
    <*> (P.string "Time: " *> line)
    <*> (P.manyTill P.anyChar (P.string "Join Zoom Meeting") *> P.spaces *> line)
    <*> (P.manyTill P.anyChar (P.string "Meeting ID: ") *> line)
    <*> (P.manyTill P.anyChar (P.string "Passcode: ") *> line)

line :: P.Parser String
line = P.manyTill P.anyChar P.newline
