-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Object.AssetEdge exposing (cursor, node)

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


{-| The item at the end of the edge.
-}
node : SelectionSet decodesTo DB.Object.Asset -> SelectionSet decodesTo DB.Object.AssetEdge
node object_ =
    Object.selectionForCompositeField "node" [] object_ identity


{-| A cursor for use in pagination.
-}
cursor : SelectionSet String DB.Object.AssetEdge
cursor =
    Object.selectionForField "String" "cursor" [] Decode.string
