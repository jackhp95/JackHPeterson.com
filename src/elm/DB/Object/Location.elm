-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Object.Location exposing (createdAt, id, updatedAt)

import DB.Object
import DB.Scalar
import DB.ScalarDecoders
import Graphql.Internal.Builder.Object as Object
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)


id : SelectionSet DB.ScalarDecoders.Id DB.Object.Location
id =
    Object.selectionForField "ScalarDecoders.Id" "id" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderId)


createdAt : SelectionSet DB.ScalarDecoders.DateTime DB.Object.Location
createdAt =
    Object.selectionForField "ScalarDecoders.DateTime" "createdAt" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderDateTime)


updatedAt : SelectionSet DB.ScalarDecoders.DateTime DB.Object.Location
updatedAt =
    Object.selectionForField "ScalarDecoders.DateTime" "updatedAt" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderDateTime)