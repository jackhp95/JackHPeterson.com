module Type exposing (BlogPost, Contact, Everything, Model, Msg(..), Project)

import Graphql.Http


type Msg
    = GotEverything (Result (Graphql.Http.Error Everything) Everything)
    | NoOp


type alias Model =
    { blogPosts : List BlogPost
    , contacts : List Contact
    , projects : List Project
    }


type alias BlogPost =
    { title : String
    , teaser : Maybe String
    , body : String

    -- , picture : Maybe String
    , views : Maybe Int

    -- , tags : List String
    }


type alias Contact =
    { color : Maybe String
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
