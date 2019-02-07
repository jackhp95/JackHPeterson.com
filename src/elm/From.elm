module From exposing (hsluvToHue)

import HSLuv exposing (..)


hsluvToHue : HSLuv.HSLuv -> Float
hsluvToHue color =
    HSLuv.toHsluv color
        |> .hue
        |> (\x -> x * 360)
