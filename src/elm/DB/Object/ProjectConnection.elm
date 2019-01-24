-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Object.ProjectConnection exposing (aggregate, edges, pageInfo)

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


{-| Information to aid in pagination.
-}
pageInfo : SelectionSet decodesTo DB.Object.PageInfo -> SelectionSet decodesTo DB.Object.ProjectConnection
pageInfo object_ =
    Object.selectionForCompositeField "pageInfo" [] object_ identity


{-| A list of edges.
-}
edges : SelectionSet decodesTo DB.Object.ProjectEdge -> SelectionSet (List (Maybe decodesTo)) DB.Object.ProjectConnection
edges object_ =
    Object.selectionForCompositeField "edges" [] object_ (identity >> Decode.nullable >> Decode.list)


aggregate : SelectionSet decodesTo DB.Object.AggregateProject -> SelectionSet decodesTo DB.Object.ProjectConnection
aggregate object_ =
    Object.selectionForCompositeField "aggregate" [] object_ identity