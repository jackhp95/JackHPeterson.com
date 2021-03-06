-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Scalar exposing (DateTime(..), Decoders, Id(..), Long(..), defaultDecoders, defineDecoders, unwrapDecoders)

import Graphql.Internal.Builder.Object as Object
import Json.Decode as Decode exposing (Decoder)


type DateTime
    = DateTime String


type Id
    = Id String


type Long
    = Long String


defineDecoders :
    { decoderDateTime : Decoder decoderDateTime
    , decoderId : Decoder decoderId
    , decoderLong : Decoder decoderLong
    }
    -> Decoders decoderDateTime decoderId decoderLong
defineDecoders definitions =
    Decoders
        { decoderDateTime = definitions.decoderDateTime
        , decoderId = definitions.decoderId
        , decoderLong = definitions.decoderLong
        }


unwrapDecoders :
    Decoders decoderDateTime decoderId decoderLong
    ->
        { decoderDateTime : Decoder decoderDateTime
        , decoderId : Decoder decoderId
        , decoderLong : Decoder decoderLong
        }
unwrapDecoders (Decoders unwrappedDecoders) =
    unwrappedDecoders


type Decoders decoderDateTime decoderId decoderLong
    = Decoders (RawDecoders decoderDateTime decoderId decoderLong)


type alias RawDecoders decoderDateTime decoderId decoderLong =
    { decoderDateTime : Decoder decoderDateTime
    , decoderId : Decoder decoderId
    , decoderLong : Decoder decoderLong
    }


defaultDecoders : RawDecoders DateTime Id Long
defaultDecoders =
    { decoderDateTime = Object.scalarDecoder |> Decode.map DateTime
    , decoderId = Object.scalarDecoder |> Decode.map Id
    , decoderLong = Object.scalarDecoder |> Decode.map Long
    }
