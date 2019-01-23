-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Enum.ColorOrderByInput exposing (ColorOrderByInput(..), decoder, list, toString)

import Json.Decode as Decode exposing (Decoder)


type ColorOrderByInput
    = Id_ASC
    | Id_DESC
    | CreatedAt_ASC
    | CreatedAt_DESC
    | UpdatedAt_ASC
    | UpdatedAt_DESC


list : List ColorOrderByInput
list =
    [ Id_ASC, Id_DESC, CreatedAt_ASC, CreatedAt_DESC, UpdatedAt_ASC, UpdatedAt_DESC ]


decoder : Decoder ColorOrderByInput
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "id_ASC" ->
                        Decode.succeed Id_ASC

                    "id_DESC" ->
                        Decode.succeed Id_DESC

                    "createdAt_ASC" ->
                        Decode.succeed CreatedAt_ASC

                    "createdAt_DESC" ->
                        Decode.succeed CreatedAt_DESC

                    "updatedAt_ASC" ->
                        Decode.succeed UpdatedAt_ASC

                    "updatedAt_DESC" ->
                        Decode.succeed UpdatedAt_DESC

                    _ ->
                        Decode.fail ("Invalid ColorOrderByInput type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : ColorOrderByInput -> String
toString enum =
    case enum of
        Id_ASC ->
            "id_ASC"

        Id_DESC ->
            "id_DESC"

        CreatedAt_ASC ->
            "createdAt_ASC"

        CreatedAt_DESC ->
            "createdAt_DESC"

        UpdatedAt_ASC ->
            "updatedAt_ASC"

        UpdatedAt_DESC ->
            "updatedAt_DESC"
