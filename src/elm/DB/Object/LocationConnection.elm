-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Object.LocationConnection exposing (aggregate, edges, pageInfo)

import DB.Object
import Graphql.Internal.Builder.Object as Object
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Information to aid in pagination.
-}
pageInfo : SelectionSet decodesTo DB.Object.PageInfo -> SelectionSet decodesTo DB.Object.LocationConnection
pageInfo object_ =
    Object.selectionForCompositeField "pageInfo" [] object_ identity


{-| A list of edges.
-}
edges : SelectionSet decodesTo DB.Object.LocationEdge -> SelectionSet (List (Maybe decodesTo)) DB.Object.LocationConnection
edges object_ =
    Object.selectionForCompositeField "edges" [] object_ (identity >> Decode.nullable >> Decode.list)


aggregate : SelectionSet decodesTo DB.Object.AggregateLocation -> SelectionSet decodesTo DB.Object.LocationConnection
aggregate object_ =
    Object.selectionForCompositeField "aggregate" [] object_ identity