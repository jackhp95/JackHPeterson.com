module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


type alias Contact =
    { color : String
    , link : String
    , name : String
    , cta : String
    }


contactBtn : Contact -> Html Msg
contactBtn { color, link, name, cta } =
    li [ class "hide-child dib mv1 ml1" ]
        [ a
            [ class "up dib link black b--black-10 bw1 ba br2 ph2 pv1 ma0 glow pointer"
            , class color
            , href link
            , target "_blank"
            ]
            [ text name ]
        , span [ class "top-0 right-0 black absolute child pt3 f7 black-80 pr2 fw4 tracked-tiny" ]
            [ text cta ]
        ]


view : Model -> Html Msg
view model =
    div [ class "vh-100 flex flex-column-ns flex-column-reverse f6 bg-white swap-font fw4 smooth-text rubik black" ]
        [ header [ class "flex-none z-max w-100 bg-black-05" ]
            [ div [ class "justify-between items-stretch flex overflow-auto" ]
                [ div [ class "dn flex-ns items-stretch justify-center hover-bg-white pv1" ]
                    [ h1 [ class "ma0 ph3 hover-bg-black-05 bg-white black f5 tracked-tiny fw7 flex items-center" ]
                        [ text "Jack H. Peterson" ]
                    ]
                , ul [ class "flex-auto flex justify-end-ns justify-center list ma0 pa0 flex items-center tc" ]
                    [ div [ class "dn db-ns flex-auto bg-white mv1 self-stretch" ]
                        []
                    , li [ class "flex-auto flex-none-ns hover-bg-white bg-transparent overflow-hidden pv1" ]
                        [ a
                            [ class "black bg-white link pa3 flex justify-center items-center"
                            , href "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
                            , target "_blank"
                            ]
                            [ span
                                [ class "pa2 pt1 pl1 contain bg-center mr2"
                                , style "background-image" "url('https://icongr.am/clarity/tasks.svg?color=000000')"
                                ]
                                []
                            , text "Work"
                            ]
                        ]
                    , li [ class "flex-auto flex-none-ns hover-bg-white bg-transparent overflow-hidden pv1" ]
                        [ a
                            [ class "black bg-white link pa3 flex justify-center items-center"
                            , href "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
                            , target "_blank"
                            ]
                            [ span
                                [ class "pa2 pt1 pl1 contain bg-center mr2"
                                , style "background-image" "url('https://icongr.am/clarity/scroll.svg?color=000000')"
                                ]
                                []
                            , text "Blog"
                            ]
                        ]
                    , li [ class "flex-auto flex-none-ns hover-bg-white bg-transparent overflow-hidden pv1" ]
                        [ a
                            [ class "black bg-white link pa3 flex justify-center items-center"
                            , href "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
                            , target "_blank"
                            ]
                            [ span
                                [ class "pa2 pt1 pl1 contain bg-center mr2"
                                , style "background-image" "url('https://icongr.am/clarity/flow-chart.svg?color=000000')"
                                ]
                                []
                            , text "Process"
                            ]
                        ]
                    , li [ class "flex-auto flex-none-ns hover-bg-white bg-transparent overflow-hidden pv1" ]
                        [ a
                            [ class "black bg-white link pa3 flex justify-center items-center"
                            , href "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
                            , target "_blank"
                            ]
                            [ span
                                [ class "pa2 pt1 pl1 contain bg-center mr2"
                                , style "background-image" "url('https://icongr.am/clarity/tools.svg?color=000000')"
                                ]
                                []
                            , text "Tools"
                            ]
                        ]
                    ]
                ]
            ]
        , main_ [ class "flex-auto flex flex-row-l flex-wrap flex-nowrap-l overflow-auto" ]
            [ div [ class "flex-auto flex-shrink-0-l self-center measure-wide-l center pa3 ma4 flex flex-wrap justify-around items-center" ]
                [ ul [ class "flex flex-wrap items-center justify-center" ]
                    [ div [ class "ma3 flex-none grow bg-black-05 br-100 relative overflow-hidden" ]
                        [ div
                            [ class "pa4 pt5 pl5 ma1 bg-center cover white br-100 ba bw2 grow-large"
                            , style "background-image" "url('https://pbs.twimg.com/profile_images/921053650880839680/MxHCQiO0_400x400.jpg')"
                            ]
                            []
                        ]
                    , ul [ class "self-center list pa0 pl1 ma3 f5 fw4 flex-none measure bg-black-05" ]
                        [ li [ class "bg-white right ph3 pv2" ]
                            [ text "Create with purpose." ]
                        , li [ class "bg-white right ph3 pv2" ]
                            [ text "Design with intent." ]
                        , li [ class "bg-white right ph3 pv2" ]
                            [ text "Develop with confidence." ]
                        ]
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
                        List.map contactBtn contactInfos
                    ]
                ]
            , div [ class "flex-auto relative overflow-auto bg-black-05" ]
                [ section [ class "tc" ]
                    [ article [ class "bg-white pt1 ma1 mt0-l" ]
                        [ h1 []
                            [ text "Design" ]
                        , ul [ class "flex flex-wrap-reverse list ma0 pa0" ]
                            [ li
                                [ class "flex-auto relative overflow-hidden white bg-red bg-center cover"
                                , style "background-image" "url('https://source.unsplash.com/1600x900/?computer')"
                                ]
                                [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--1x1-l aspect-ratio--16x9" ]
                                    []
                                , a
                                    [ class "link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-50 grow"
                                    , href "google.com"
                                    ]
                                    [ text "JackHPeterson.com" ]
                                ]
                            , li
                                [ class "flex-auto relative overflow-hidden white bg-green bg-center cover"
                                , style "background-image" "url('https://source.unsplash.com/1600x900/?romance')"
                                ]
                                [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--1x1-l aspect-ratio--16x9" ]
                                    []
                                , a
                                    [ class "link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-50 grow"
                                    , href "google.com"
                                    ]
                                    [ text "PlusOne.Dating" ]
                                ]
                            , li
                                [ class "flex-auto relative overflow-hidden white bg-blue bg-center cover"
                                , style "background-image" "url('https://source.unsplash.com/1600x900/?nomad')"
                                ]
                                [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--1x1-l aspect-ratio--16x9" ]
                                    []
                                , a
                                    [ class "link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-50 grow"
                                    , href "google.com"
                                    ]
                                    [ text "Live Anywhere" ]
                                ]
                            ]
                        ]
                    , article [ class "bg-white pt1 ma1 mt0-l" ]
                        [ h1 []
                            [ text "Development" ]
                        , ul [ class "flex flex-wrap-reverse list ma0 pa0" ]
                            [ li
                                [ class "flex-auto relative overflow-hidden white bg-red bg-center cover"
                                , style "background-image" "url('https://source.unsplash.com/1600x900/?move')"
                                ]
                                [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--1x1-l aspect-ratio--16x9" ]
                                    []
                                , a
                                    [ class "link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-50 grow"
                                    , href "google.com"
                                    ]
                                    [ text "RooSorage.com" ]
                                ]
                            , li
                                [ class "flex-auto relative overflow-hidden white bg-green bg-center cover"
                                , style "background-image" "url('https://source.unsplash.com/1600x900/?romance')"
                                ]
                                [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--1x1-l aspect-ratio--16x9" ]
                                    []
                                , a
                                    [ class "link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-50 grow"
                                    , href "google.com"
                                    ]
                                    [ text "PlusOne.dating" ]
                                ]
                            , li
                                [ class "flex-auto relative overflow-hidden white bg-blue bg-center cover"
                                , style "background-image" "url('https://source.unsplash.com/1600x900/?video')"
                                ]
                                [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--1x1-l aspect-ratio--16x9" ]
                                    []
                                , a
                                    [ class "link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-50 grow"
                                    , href "google.com"
                                    ]
                                    [ text "BenChristensen.com" ]
                                ]
                            ]
                        ]
                    , article [ class "bg-white pt1 ma1 mt0-l" ]
                        [ h1 []
                            [ text "Side Projects" ]
                        , ul [ class "flex flex-wrap-reverse list ma0 pa0" ]
                            [ li
                                [ class "flex-auto relative overflow-hidden white bg-red bg-center cover"
                                , style "background-image" "url('https://source.unsplash.com/1600x900/?nomad')"
                                ]
                                [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--1x1-l aspect-ratio--16x9" ]
                                    []
                                , a
                                    [ class "link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-50 grow"
                                    , href "google.com"
                                    ]
                                    [ text "LiveAnywhere" ]
                                ]
                            , li
                                [ class "flex-auto relative overflow-hidden white bg-green bg-center cover"
                                , style "background-image" "url('https://source.unsplash.com/1600x900/?picture')"
                                ]
                                [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--1x1-l aspect-ratio--16x9" ]
                                    []
                                , a
                                    [ class "link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-50 grow"
                                    , href "google.com"
                                    ]
                                    [ text "RandomImgur" ]
                                ]
                            , li
                                [ class "flex-auto relative overflow-hidden white bg-blue bg-center cover"
                                , style "background-image" "url('https://source.unsplash.com/1600x900/?bootstrap')"
                                ]
                                [ div [ class "dib pl6 pr7 aspect-ratio aspect-ratio--1x1-l aspect-ratio--16x9" ]
                                    []
                                , a
                                    [ class "link white absolute absolute--fill flex items-center justify-center bg-black-30 glow o-50 grow"
                                    , href "google.com"
                                    ]
                                    [ text "DynamiCss" ]
                                ]
                            ]
                        ]
                    ]
                , section []
                    [ article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?elm,love')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Why I like Elm!" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?tech,speed')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Technical debt vs speed of development" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?talent')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "The Best tool is the Tool you know!" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?scale')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Optimizations and scale are overrated for startups" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?scope')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Scope (MVP)" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?programming')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Functional vs object oriented vs procedural" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?leaky')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Side effects" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?types')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Strong types" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?compile')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Compiled vs runtime" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?truth')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "One source of truth" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?pieces')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Components vs functions" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?relation')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "GraphQL" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?storage')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "SQL vs noSQL" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?repair')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Joys of Refactoring" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?structure')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Importance of data structures." ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?web,coding')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "All of web dev is a hack." ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?inherit')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Inheritance is hell for Refactoring" ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?assume')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Assumptions should never be a dependency/default." ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?planning')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Schemas are good because they allow data structures to safely evolve." ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?messy')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Object oriented design is indisputably bad." ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?message')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "Object oriented programming can be fine with actor model." ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?service')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "BaaS and SaaS are decent stepping Stones and can be relied on when you are aware of the scope/spec." ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?shortcut')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "A shortcut doesn’t reduce work. It delays needed work at the cost of time." ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    , article [ class "bg-white ma1 mt0-l flex flex-wrap relative" ]
                        [ header
                            [ class "pl7 pt7 flex-auto bg-center bg-black-05 cover relative"
                            , style "background-image" "url('https://source.unsplash.com/1600x900/?elm')"
                            ]
                            [ div [ class "o-50 tr glow f7 absolute absolute--fill flex justify-end items-end ma1" ]
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
                                [ text "The craftsmanship in the design of Elm is amazing. " ]
                            , p [ class "lh-copy o-80" ]
                                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam voluptas qui, id, nulla provident corporislaborum earum voluptatibus suscipit quod blanditiis a atque iusto culpa est, facere obcaecati debitis deserunt!" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }


contactInfos =
    [ { color = "hover-dark-pink"
      , link = "sms:15733408423;?&body=message%20more%20message"
      , name = "Text"
      , cta = "Text: 573 ) 340 - 8423"
      }
    , { color = "hover-blue"
      , link = "tel:15733408423"
      , name = "Call"
      , cta = "Call: 573 ) 340 - 8423"
      }
    , { color = "hover-red"
      , link = "mailto:someone@yoursite.com?subject=Big%20News&body=Body-goes-here"
      , name = "Email"
      , cta = "Email: 573 ) 340 - 8423"
      }
    , { color = "hover-blue"
      , link = "https://mobile.twitter.com/JackHPeterson"
      , name = "Twitter"
      , cta = "Tweet: @JackHPeterson"
      }
    , { color = "hover-green"
      , link = "https://medium.com/@JackHPeterson"
      , name = "Medium"
      , cta = "Claps: @JackHPeterson"
      }
    , { color = "hover-purple"
      , link = "https://github.com/jackhp95"
      , name = "GitHub"
      , cta = "Follow: @jackhp95"
      }
    , { color = "hover-gold"
      , link = "https://codepen.io/JackHP95/"
      , name = "CodePen"
      , cta = "Pens: @JackHP95"
      }
    , { color = "hover-dark-blue"
      , link = "https://www.facebook.com/JackHenryPeterson"
      , name = "Facebook"
      , cta = "Friend: JackHenryPeterson"
      }
    , { color = "hover-light-purple"
      , link = "https://www.instagram.com/jackhenrypeterson/"
      , name = "Instagram"
      , cta = "Follow: @jackhenrypeterson"
      }
    , { color = "hover-blue"
      , link = "https://www.linkedin.com/in/jack-peterson-59385165/"
      , name = "LinkedIn"
      , cta = "My LinkedIn Profile"
      }
    , { color = "hover-green"
      , link = "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=qDjO0VVFQI-u0WZxVUmdIA"
      , name = "Spotify"
      , cta = "My Discover Weekly"
      }
    , { color = "hover-purple"
      , link = "twitch.com"
      , name = "Twitch"
      , cta = "Follow: jackhp95"
      }
    , { color = "hover-blue"
      , link = "paypal.me/JackHPeterson"
      , name = "PayPal"
      , cta = "Pay: JackHPeterson"
      }
    ]
