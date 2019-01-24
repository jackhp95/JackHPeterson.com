module Main exposing (blogPost, contactBtn, init, main, navTab, project, projectsView, sideBar, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Maybe.Extra exposing (..)
import Request exposing (..)
import Type exposing (..)



---- MODEL ----


init : ( Model, Cmd Msg )
init =
    ( Model [] [] []
    , Request.everything
    )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotEverything (Ok everything) ->
            ( { blogPosts = Maybe.Extra.values everything.blogPosts
              , contacts = Maybe.Extra.values everything.contacts
              , projects = Maybe.Extra.values everything.projects
              }
            , Cmd.none
            )

        _ ->
            ( model, Cmd.none )



---- VIEW ----


contactBtn : Contact -> Html Msg
contactBtn contact =
    li [ class "hide-child dib mv1 ml1" ]
        [ a
            [ class "up dib link black b--black-10 bw1 ba br2 ph2 pv1 ma0 glow pointer"
            , class <| "hover-" ++ Maybe.withDefault "black" contact.color
            , href contact.href
            , target "_blank"
            ]
            [ text contact.name ]
        , span [ class "top-0 right-0 black absolute child pt3 f-1 black-80 pr2 fw4 tracked-tiny" ]
            [ text <| contact.action ++ ": " ++ contact.handle ]
        ]


blogPost : BlogPost -> Html Msg
blogPost { title } =
    article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
        [ header
            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
            , style "background-image" <| "url('https://source.unsplash.com/1600x900/?" ++ (String.words title |> String.join ",") ++ "')"
            ]
            [ div [ class "o-70 tr glow f-1 absolute absolute--fill flex justify-end items-end ma1" ]
                [ span [ class "bg-white ph2 pv1 dib ma1" ]
                    [ text "3 mins" ]
                , span [ class "bg-white ph2 pv1 dib ma1" ]
                    [ text "9/5/2018" ]
                , span [ class "bg-white ph2 pv1 dib ma1" ]
                    [ text "Jack H. Peterson" ]
                ]
            ]
        , div [ class "ph5-l ph4-ns pa3 measure center f5" ]
            [ h1 [ class "f4 f3-ns tracked-tiny" ]
                [ text title ]
            , p [ class "lh-copy o-80" ]
                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
            ]
        ]


project : Project -> Html Msg
project { name } =
    li
        [ class "flex-auto relative overflow-hidden white bg-black-20 bg-center cover"
        , style "background-image" "url('https://source.unsplash.com/1600x900/?work')"
        ]
        [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--16x9" ]
            []
        , a
            [ class "f4 fw6 tracked-1 link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-70 grow"
            , href <| "https://" ++ name
            ]
            [ text name ]
        ]


projectsView : List ( String, List Project ) -> Html Msg
projectsView projectCategoryList =
    section [ class "tc" ] <|
        List.map
            (\( category, projects ) ->
                article [ class "bg-white pt1 ma1 mt0-l" ]
                    [ h1 [ class "f3" ]
                        [ text category ]
                    , ul [ class "flex flex-wrap-reverse list ma0 pa0" ] <|
                        List.map project projects
                    ]
            )
            projectCategoryList


navTab : ( String, String ) -> Html Msg
navTab ( icon, name ) =
    li [ class "flex-auto flex-none-ns hover-bg-white bg-transparent overflow-hidden pv1" ]
        [ a
            [ class "black bg-white link pa3 flex justify-center items-center"
            , href "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
            , target "_blank"
            ]
            [ span
                [ class "pa2 pt1 pl1 contain bg-center mr2"
                , style "background-image" <| "url('" ++ icon ++ "')"
                ]
                []
            , text name
            ]
        ]


sideBar : List Contact -> Html Msg
sideBar contacts =
    aside [ class "flex-auto flex-shrink-0-l self-center measure-wide-l center pa3 ma4 flex flex-wrap justify-around items-center" ]
        [ ul [ class "flex flex-wrap items-center justify-center" ]
            [ div [ class "ma3 flex-none grow bg-black-05 br-100 relative overflow-hidden" ]
                [ div
                    [ class "pa4 pt5 pl5 ma1 bg-center cover white br-100 ba bw2 grow-large"
                    , style "background-image" "url('https://pbs.twimg.com/profile_images/921053650880839680/MxHCQiO0_400x400.jpg')"
                    ]
                    []
                ]
            , ul [ class "self-center list pa0 pl1 ma3 f5 fw4 flex-none measure bg-black-05" ] <|
                List.map
                    (\x -> li [ class "bg-white right ph3 pv2" ] [ text x ])
                    [ "Create with purpose.", "Design with intent.", "Develop with confidence." ]
            ]
        , div [ class "lh-solid flex-none mv3 mh3-ns mh0 flex flex-column items-stretch" ]
            [ h1 [ class "f2 self-center pa0 ma0 grow tracked-tiny fw7 hover-bg-black-05 bg-white black" ]
                [ span [ class "" ]
                    [ text "Jack H." ]
                , span [ class "" ]
                    [ text "Peterson" ]
                ]
            , div [ class "pt1 mv2 bg-black-05" ]
                []
            , ul [ class "list lh-copy flex ma0 pa0 mt1 fw4 ttu f6 tracked di bg-black-05" ]
                [ li [ class "flex-auto tc bg-white" ]
                    [ text "Designer" ]
                , li [ class "mh1 flex-auto tc bg-white" ]
                    [ text "Developer" ]
                , li [ class "flex-auto tc bg-white" ]
                    [ text "Creative" ]
                ]
            ]
        , div [ class "flex-auto ma3-ns ma2 measure" ]
            [ h2 [ class "flex-auto fw7 f5 mh2 mv2 bb ph0 pv1 tracked-tiny b--black-05 bw2" ]
                [ text "About" ]
            , p [ class "mh2 mv0 pa0 lh-copy" ]
                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur distinctio corrupti, architecto temporalabore laudantiumducimus quis excepturi sequi deleniti repudiandae amet dolorem repellendus minima vitae atque quos illo esse." ]
            ]
        , div [ class "flex-auto ma3-ns ma2 measure relative" ]
            [ h2 [ class "flex-auto fw7 f5 mh2 mv2 bb ph0 pv1 tracked-tiny b--black-05 bw2" ]
                [ text "Contact" ]
            , ul [ class "list ma0 pa0 lh-title mh1 fw7" ] <|
                List.map contactBtn contacts
            ]
        ]


view : Model -> Browser.Document Msg
view { blogPosts, contacts, projects } =
    { title = "Jack H. Peterson"
    , body =
        [ div [ class "vh-100 flex flex-column-ns flex-column-reverse f6 bg-white swap-font fw4 smooth-text rubik black" ]
            [ header [ class "flex-none z-max w-100 bg-black-05" ]
                [ div [ class "justify-between items-stretch flex overflow-auto" ]
                    [ div [ class "dn flex-ns items-stretch justify-center hover-bg-white pv1" ]
                        [ h1 [ class "ma0 ph3 hover-bg-black-05 bg-white black f5 tracked-tiny fw7 flex items-center" ]
                            [ text "Jack H. Peterson" ]
                        ]
                    , ul [ class "flex-auto flex justify-end-ns justify-center list ma0 pa0 flex items-center tc" ]
                        [ div [ class "dn db-ns flex-auto bg-white mv1 self-stretch" ]
                            []
                        , navTab ( "https://icongr.am/clarity/tasks.svg?color=000000", "Work" )
                        , navTab ( "https://icongr.am/clarity/scroll.svg?color=000000", "Blog" )
                        , navTab ( "https://icongr.am/clarity/flow-chart.svg?color=000000", "Process" )
                        , navTab ( "https://icongr.am/clarity/tools.svg?color=000000", "Tools" )
                        ]
                    ]
                ]
            , main_ [ class "flex-auto flex flex-row-l flex-wrap flex-nowrap-l overflow-auto" ]
                [ sideBar contacts
                , div [ class "flex-auto relative overflow-auto bg-black-05" ]
                    [ projectsView
                        [ ( "Projects"
                          , projects
                          )
                        ]
                    , section [] <|
                        h3 [ class "sticky top-0 f3 tc bg-white z-1 pa3 ma0" ] [ text "Blogs" ]
                            :: List.map blogPost blogPosts
                    ]
                ]
            ]
        ]
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
