module Main exposing (init, main, update, view)

import Browser
import Color exposing (..)
import Css
import Css.Global
import From exposing (..)
import HSLuv exposing (..)
import Home
import Html.Styled as Html exposing (..)
import Maybe.Extra
import Request
import Type exposing (..)



---- MODEL ----


init : ( Model, Cmd Msg )
init =
    ( Model Home primary [] [] []
    , Request.everything
    )


primary : Color
primary =
    { hue = 145
    , saturation = 100
    , lightness = 50
    , alpha = 1
    }
        |> hsluv360
        |> toColor



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotEverything (Ok everything) ->
            ( { model
                | blogPosts = Maybe.Extra.values everything.blogPosts
                , contacts = Maybe.Extra.values everything.contacts
                , projects = Maybe.Extra.values everything.projects
              }
            , Cmd.none
            )

        _ ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Browser.Document Msg
view model =
    { title = "Jack H. Peterson"
    , body =
        List.map toUnstyled <|
            Css.Global.global
                [ Css.Global.typeSelector ":root"
                    [ HSLuv.color model.primary
                        |> From.hsluvToHue
                        |> String.fromFloat
                        |> Css.property "--hue"
                    ]
                ]
                :: (case model.route of
                        Post ->
                            []

                        Home ->
                            Home.view model
                   )
    }



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.application
        { init = \_ _ _ -> init
        , onUrlChange = \_ -> Type.NoOp
        , onUrlRequest = \_ -> Type.NoOp
        , subscriptions = always Sub.none
        , update = update
        , view = view
        }
