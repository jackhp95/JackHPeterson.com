-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module DB.Object.Asset exposing (ImagesProjectOptionalArguments, PictureBlogPostOptionalArguments, PictureProjectOptionalArguments, UrlOptionalArguments, createdAt, fileName, handle, height, id, imagesProject, mimeType, pictureBlogPost, pictureProject, size, status, updatedAt, url, width)

import DB.Enum.BlogPostOrderByInput
import DB.Enum.ProjectOrderByInput
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


status : SelectionSet DB.Enum.Status.Status DB.Object.Asset
status =
    Object.selectionForField "Enum.Status.Status" "status" [] DB.Enum.Status.decoder


id : SelectionSet DB.ScalarDecoders.Id DB.Object.Asset
id =
    Object.selectionForField "ScalarDecoders.Id" "id" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderId)


createdAt : SelectionSet DB.ScalarDecoders.DateTime DB.Object.Asset
createdAt =
    Object.selectionForField "ScalarDecoders.DateTime" "createdAt" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderDateTime)


updatedAt : SelectionSet DB.ScalarDecoders.DateTime DB.Object.Asset
updatedAt =
    Object.selectionForField "ScalarDecoders.DateTime" "updatedAt" [] (DB.ScalarDecoders.decoders |> DB.Scalar.unwrapDecoders |> .decoderDateTime)


handle : SelectionSet String DB.Object.Asset
handle =
    Object.selectionForField "String" "handle" [] Decode.string


fileName : SelectionSet String DB.Object.Asset
fileName =
    Object.selectionForField "String" "fileName" [] Decode.string


height : SelectionSet (Maybe Float) DB.Object.Asset
height =
    Object.selectionForField "(Maybe Float)" "height" [] (Decode.float |> Decode.nullable)


mimeType : SelectionSet (Maybe String) DB.Object.Asset
mimeType =
    Object.selectionForField "(Maybe String)" "mimeType" [] (Decode.string |> Decode.nullable)


size : SelectionSet (Maybe Float) DB.Object.Asset
size =
    Object.selectionForField "(Maybe Float)" "size" [] (Decode.float |> Decode.nullable)


width : SelectionSet (Maybe Float) DB.Object.Asset
width =
    Object.selectionForField "(Maybe Float)" "width" [] (Decode.float |> Decode.nullable)


type alias PictureBlogPostOptionalArguments =
    { where_ : OptionalArgument DB.InputObject.BlogPostWhereInput
    , orderBy : OptionalArgument DB.Enum.BlogPostOrderByInput.BlogPostOrderByInput
    , skip : OptionalArgument Int
    , after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    }


{-|

  - where\_ -

-}
pictureBlogPost : (PictureBlogPostOptionalArguments -> PictureBlogPostOptionalArguments) -> SelectionSet decodesTo DB.Object.BlogPost -> SelectionSet (Maybe (List decodesTo)) DB.Object.Asset
pictureBlogPost fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { where_ = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "where" filledInOptionals.where_ DB.InputObject.encodeBlogPostWhereInput, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum DB.Enum.BlogPostOrderByInput.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "pictureBlogPost" optionalArgs object_ (identity >> Decode.list >> Decode.nullable)


type alias ImagesProjectOptionalArguments =
    { where_ : OptionalArgument DB.InputObject.ProjectWhereInput
    , orderBy : OptionalArgument DB.Enum.ProjectOrderByInput.ProjectOrderByInput
    , skip : OptionalArgument Int
    , after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    }


{-|

  - where\_ -

-}
imagesProject : (ImagesProjectOptionalArguments -> ImagesProjectOptionalArguments) -> SelectionSet decodesTo DB.Object.Project -> SelectionSet (Maybe (List decodesTo)) DB.Object.Asset
imagesProject fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { where_ = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "where" filledInOptionals.where_ DB.InputObject.encodeProjectWhereInput, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum DB.Enum.ProjectOrderByInput.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "imagesProject" optionalArgs object_ (identity >> Decode.list >> Decode.nullable)


type alias PictureProjectOptionalArguments =
    { where_ : OptionalArgument DB.InputObject.ProjectWhereInput
    , orderBy : OptionalArgument DB.Enum.ProjectOrderByInput.ProjectOrderByInput
    , skip : OptionalArgument Int
    , after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    }


{-|

  - where\_ -

-}
pictureProject : (PictureProjectOptionalArguments -> PictureProjectOptionalArguments) -> SelectionSet decodesTo DB.Object.Project -> SelectionSet (Maybe (List decodesTo)) DB.Object.Asset
pictureProject fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { where_ = Absent, orderBy = Absent, skip = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs =
            [ Argument.optional "where" filledInOptionals.where_ DB.InputObject.encodeProjectWhereInput, Argument.optional "orderBy" filledInOptionals.orderBy (Encode.enum DB.Enum.ProjectOrderByInput.toString), Argument.optional "skip" filledInOptionals.skip Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "pictureProject" optionalArgs object_ (identity >> Decode.list >> Decode.nullable)


type alias UrlOptionalArguments =
    { transformation : OptionalArgument DB.InputObject.AssetTransformationInput }


{-| Get the url for the asset with provided transformations applied.
-}
url : (UrlOptionalArguments -> UrlOptionalArguments) -> SelectionSet String DB.Object.Asset
url fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { transformation = Absent }

        optionalArgs =
            [ Argument.optional "transformation" filledInOptionals.transformation DB.InputObject.encodeAssetTransformationInput ]
                |> List.filterMap identity
    in
    Object.selectionForField "String" "url" optionalArgs Decode.string
