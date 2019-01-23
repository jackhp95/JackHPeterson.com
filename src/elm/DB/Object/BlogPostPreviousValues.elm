-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Object.BlogPostPreviousValues exposing (body, createdAt, id, status, tags, teaser, title, updatedAt, views)

import DB.Enum.Status
import DB.Object
import DB.Scalar
import DB.ScalarDecoders
import Graphql.Internal.Builder.Object as Object
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


status : SelectionSet DB.Enum.Status.Status DB.Object.BlogPostPreviousValues
status =
    Object.selectionForField "Enum.Status.Status" "status" [] DB.Enum.Status.decoder


id : SelectionSet DB.ScalarDecoders.Id DB.Object.BlogPostPreviousValues
id =
    Object.selectionForField "ScalarDecoders.Id" "id" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderId)


createdAt : SelectionSet DB.ScalarDecoders.DateTime DB.Object.BlogPostPreviousValues
createdAt =
    Object.selectionForField "ScalarDecoders.DateTime" "createdAt" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderDateTime)


updatedAt : SelectionSet DB.ScalarDecoders.DateTime DB.Object.BlogPostPreviousValues
updatedAt =
    Object.selectionForField "ScalarDecoders.DateTime" "updatedAt" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderDateTime)


title : SelectionSet String DB.Object.BlogPostPreviousValues
title =
    Object.selectionForField "String" "title" [] Decode.string


teaser : SelectionSet (Maybe String) DB.Object.BlogPostPreviousValues
teaser =
    Object.selectionForField "(Maybe String)" "teaser" [] (Decode.string |> Decode.nullable)


body : SelectionSet String DB.Object.BlogPostPreviousValues
body =
    Object.selectionForField "String" "body" [] Decode.string


views : SelectionSet (Maybe Int) DB.Object.BlogPostPreviousValues
views =
    Object.selectionForField "(Maybe Int)" "views" [] (Decode.int |> Decode.nullable)


tags : SelectionSet (List String) DB.Object.BlogPostPreviousValues
tags =
    Object.selectionForField "(List String)" "tags" [] (Decode.string |> Decode.list)
