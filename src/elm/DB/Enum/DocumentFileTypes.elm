-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Enum.DocumentFileTypes exposing (DocumentFileTypes(..), decoder, list, toString)

import Json.Decode as Decode exposing (Decoder)


type DocumentFileTypes
    = Jpg
    | Odp
    | Ods
    | Odt
    | Png
    | Svg
    | Txt
    | Webp
    | Docx
    | Html
    | Pdf
    | Doc
    | Xlsx
    | Xls
    | Pptx
    | Ppt


list : List DocumentFileTypes
list =
    [ Jpg, Odp, Ods, Odt, Png, Svg, Txt, Webp, Docx, Html, Pdf, Doc, Xlsx, Xls, Pptx, Ppt ]


decoder : Decoder DocumentFileTypes
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "jpg" ->
                        Decode.succeed Jpg

                    "odp" ->
                        Decode.succeed Odp

                    "ods" ->
                        Decode.succeed Ods

                    "odt" ->
                        Decode.succeed Odt

                    "png" ->
                        Decode.succeed Png

                    "svg" ->
                        Decode.succeed Svg

                    "txt" ->
                        Decode.succeed Txt

                    "webp" ->
                        Decode.succeed Webp

                    "docx" ->
                        Decode.succeed Docx

                    "html" ->
                        Decode.succeed Html

                    "pdf" ->
                        Decode.succeed Pdf

                    "doc" ->
                        Decode.succeed Doc

                    "xlsx" ->
                        Decode.succeed Xlsx

                    "xls" ->
                        Decode.succeed Xls

                    "pptx" ->
                        Decode.succeed Pptx

                    "ppt" ->
                        Decode.succeed Ppt

                    _ ->
                        Decode.fail ("Invalid DocumentFileTypes type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : DocumentFileTypes -> String
toString enum =
    case enum of
        Jpg ->
            "jpg"

        Odp ->
            "odp"

        Ods ->
            "ods"

        Odt ->
            "odt"

        Png ->
            "png"

        Svg ->
            "svg"

        Txt ->
            "txt"

        Webp ->
            "webp"

        Docx ->
            "docx"

        Html ->
            "html"

        Pdf ->
            "pdf"

        Doc ->
            "doc"

        Xlsx ->
            "xlsx"

        Xls ->
            "xls"

        Pptx ->
            "pptx"

        Ppt ->
            "ppt"
