-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Object.Contact exposing (action, color, createdAt, handle, href, id, name, status, updatedAt)

import DB.Enum.Status
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


status : SelectionSet DB.Enum.Status.Status DB.Object.Contact
status =
    Object.selectionForField "Enum.Status.Status" "status" [] DB.Enum.Status.decoder


id : SelectionSet DB.ScalarDecoders.Id DB.Object.Contact
id =
    Object.selectionForField "ScalarDecoders.Id" "id" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderId)


createdAt : SelectionSet DB.ScalarDecoders.DateTime DB.Object.Contact
createdAt =
    Object.selectionForField "ScalarDecoders.DateTime" "createdAt" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderDateTime)


updatedAt : SelectionSet DB.ScalarDecoders.DateTime DB.Object.Contact
updatedAt =
    Object.selectionForField "ScalarDecoders.DateTime" "updatedAt" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderDateTime)


name : SelectionSet String DB.Object.Contact
name =
    Object.selectionForField "String" "name" [] Decode.string


color : SelectionSet (Maybe String) DB.Object.Contact
color =
    Object.selectionForField "(Maybe String)" "color" [] (Decode.string |> Decode.nullable)


href : SelectionSet String DB.Object.Contact
href =
    Object.selectionForField "String" "href" [] Decode.string


action : SelectionSet String DB.Object.Contact
action =
    Object.selectionForField "String" "action" [] Decode.string


handle : SelectionSet String DB.Object.Contact
handle =
    Object.selectionForField "String" "handle" [] Decode.string
