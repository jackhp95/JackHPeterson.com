-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Object.BatchPayload exposing (count)

import DB.InputObject
import DB.Interface
import DB.Object
import DB.Scalar
import DB.ScalarDecoders
import DB.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| The number of nodes that have been affected by the Batch operation.
-}
count : SelectionSet DB.ScalarDecoders.Long DB.Object.BatchPayload
count =
    Object.selectionForField "ScalarDecoders.Long" "count" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderLong)
