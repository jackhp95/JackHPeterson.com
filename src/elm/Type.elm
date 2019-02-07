module Type exposing (BlogPost, Contact, Everything, Model, Msg(..), Project, Route(..))

import Color exposing (..)
import Graphql.Http


type Msg
    = GotEverything (Result (Graphql.Http.Error Everything) Everything)
    | NoOp


type Route
    = Home
    | Post


type alias Model =
    { route : Route
    , primary : Color
    , blogPosts : List BlogPost
    , contacts : List Contact
    , projects : List Project
    }


type alias BlogPost =
    { title : String
    , maybeTeaser : Maybe String
    , body : String

    -- , picture : Maybe String
    , views : Maybe Int

    -- , tags : List String
    }


type alias Contact =
    { color : Maybe String
    , hue : Maybe Float
    , href : String
    , name : String
    , action : String
    , handle : String
    }


type alias Project =
    { name : String
    }


type alias Everything =
    { blogPosts : List (Maybe BlogPost)
    , contacts : List (Maybe Contact)
    , projects : List (Maybe Project)
    }
