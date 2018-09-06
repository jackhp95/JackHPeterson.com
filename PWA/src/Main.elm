module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Model =
    { tideOn : Bool
    , contacts : List Contact
    , about : String
    , adjectives : List String
    , phrases : List String
    , navBar : List Nav
    }


type alias Nav =
    { name : String
    , link : String
    , icon : String
    }


type alias Contact =
    { hoverColor : String
    , link : String
    , name : String
    , desc : String
    }


init : ( Model, Cmd Msg )
init =
    ( { tideOn = True
      , contacts = contacts
      , about = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur distinctio corrupti, architecto tempora labore laudantium ducimus quis excepturi sequi deleniti repudiandae amet dolorem repellendus minima vitae atque quos illo esse."
      , adjectives = adjectives
      , phrases = phrases
      , navBar = navBar
      }
    , Cmd.none
    )


navBar : List Nav
navBar =
    [ Nav
        "Work"
        "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
        "url('https://icongr.am/clarity/tasks.svg?color=ffffff')"
    , Nav
        "Blog"
        "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
        "url('https://icongr.am/clarity/scroll.svg?color=ffffff')"
    , Nav
        "Process"
        "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
        "url('https://icongr.am/clarity/flow-chart.svg?color=ffffff')"
    , Nav
        "Tools"
        "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
        "url('https://icongr.am/clarity/tools.svg?color=ffffff')"
    ]


adjectives : List String
adjectives =
    [ "Developer", "Creative", "Designer" ]


phrases : List String
phrases =
    [ "Create with purpose.", "Design with intent.", "Develop with confidence." ]


contacts : List Contact
contacts =
    [ Contact "hover-dark-pink" "sms:15733408423;?&body=message%20more%20message" "Text" "Text: 573 ) 340 - 8423"
    , Contact "hover-blue" "tel:15733408423" "Call" "Call: 573 ) 340 - 8423"
    , Contact "hover-red" "mailto:someone@yoursite.com?subject=Big%20News&body=Body-goes-here" "Email" "Email: 573 ) 340 - 8423"
    , Contact "hover-blue" "https://mobile.twitter.com/JackHPeterson" "Twitter" "Tweet: @JackHPeterson"
    , Contact "hover-green" "https://medium.com/@JackHPeterson" "Medium" "Follow: @JackHPeterson"
    , Contact "hover-purple" "https://github.com/jackhp95" "GitHub" "Follow: @jackhp95"
    , Contact "hover-gold" "https://codepen.io/JackHP95/" "CodePen" "Pens: @JackHP95"
    , Contact "hover-dark-blue" "https://www.facebook.com/JackHenryPeterson" "Facebook" "Friend: JackHenryPeterson"
    , Contact "hover-light-purple" "https://www.instagram.com/jackhenrypeterson/" "Instagram" "Follow: @jackhenrypeterson"
    , Contact "hover-blue" "https://www.linkedin.com/in/jack-peterson-59385165/" "LinkedIn" "My LinkedIn Profile"
    , Contact "hover-green" "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=qDjO0VVFQI-u0WZxVUmdIA" "Spotify" "My Discover Weekly"
    , Contact "hover-purple" "" "Twitch" "Follow: jackhp95"
    , Contact "hover-blue" "paypal.me/JackHPeterson" "PayPal" "Pay: JackHPeterson"
    ]



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


navView : Nav -> Html Msg
navView nav =
    li [ class "flex-auto flex-none-ns hover-bg-black bg-transparent overflow-hidden pv1" ]
        [ a
            [ class "white bg-black link pa3 flex justify-center items-center"
            , href nav.link
            , target "_blank"
            ]
            [ span
                [ class "pa2 pt1 pl1 contain bg-center mr2"
                , style [ ( "background-image", nav.icon ) ]
                ]
                []
            , text nav.name
            ]
        ]


headerView : List Nav -> Html Msg
headerView navBar =
    header
        [ class "flex-none z-max w-100 shadow-4 lg-disco tidex parallax" ]
        [ div
            [ class "justify-between items-stretch flex overflow-auto" ]
            [ div
                [ class "dn flex-ns items-stretch justify-center hover-bg-black pv1" ]
                [ h1
                    [ class "ma0 ph3 hover-lg-disco bg-black tidex white hover-text-clip parallax f5 tracked-tiny fw7 flex items-center" ]
                    [ text "Jack H. Peterson" ]
                ]
            , (div [ class "dn db-ns flex-auto bg-black mv1 self-stretch" ] [])
                :: List.map navView navBar
                |> ul [ class "flex-auto flex justify-end-ns justify-center list ma0 pa0 flex items-center tc" ]
            ]
        ]


asideView : Model -> Html Msg
asideView model =
    let
        contactView contact =
            li [ class "hide-child dib mv1 ml1" ]
                [ a
                    [ class <| "up dib link white ba br2 ph2 pv1 ma0 glow pointer " ++ contact.hoverColor
                    , href contact.link
                    , target "_blank"
                    ]
                    [ text contact.name ]
                , span
                    [ class "top-0 right-0 white absolute child pt3 pr2 fw4 tracked-tiny" ]
                    [ text contact.desc ]
                ]
    in
        aside
            [ class "flex-auto self-center measure-wide-l center pa3 ma4 flex flex-wrap justify-around items-center" ]
            [ div
                [ class "flex flex-wrap items-center justify-center" ]
                [ div
                    [ class "ma3 flex-none grow lg-disco tidex parallax br-100 relative overflow-hidden" ]
                    [ div
                        [ class "pa4 pt5 pl5 ma1 bg-center cover black br-100 ba bw2 grow-large", attribute "style" "background-image:url('https://pbs.twimg.com/profile_images/921053650880839680/MxHCQiO0_400x400.jpg');" ]
                        []
                    ]
                , List.map (\phrase -> li [ class "bg-black right ph3 pv2" ] [ text phrase ]) model.phrases
                    |> ul [ class "self-center list pa0 pl1 ma3 f5 fw4 flex-none measure lg-disco tidex parallax" ]
                ]
            , div
                [ class "lh-solid flex-none mv3 mh3-ns mh0 flex flex-column items-stretch" ]
                [ h1
                    [ class "f2 self-center pa0 ma0 pointer grow tracked-tiny fw7 hover-lg-disco bg-black tidex white hover-text-clip parallax" ]
                    [ span
                        [ class "" ]
                        [ text "Jack H." ]
                    , span
                        [ class "" ]
                        [ text "Peterson" ]
                    ]
                , div [ class "pt1 mv2 lg-disco tidex parallax" ] []
                , List.map (\adjective -> li [ class "flex-auto tc bg-black" ] [ text adjective ]) model.adjectives
                    |> List.intersperse (hr [ class "flex-none pl1 self-stretch bn" ] [])
                    |> ul [ class "list lh-copy flex ma0 pa0 mt1 fw4 ttu f6 tracked di lg-disco tidex parallax" ]
                ]
            , div
                [ class "flex-auto ma3-ns ma2 measure" ]
                [ h2 [ class "flex-auto fw7 f5 mh2 mv2 bb ph0 pv1 tracked-tiny b--white-20" ] [ text "About" ]
                , p [ class "mh2 mv0 pa0 lh-copy" ] [ text model.about ]
                ]
            , div
                [ class "flex-auto ma3-ns ma2 measure relative" ]
                [ h2
                    [ class "flex-auto fw7 f5 mh2 mv2 bb ph0 pv1 tracked-tiny b--white-20" ]
                    [ text "Contact" ]
                , List.map contactView model.contacts
                    |> ul [ class "list ma0 pa0 lh-title mh1 fw7" ]
                ]
            ]


view : Model -> Html Msg
view model =
    div [ class "vh-100 flex flex-column-ns flex-column-reverse f6 bg-black swap-font fw4 smooth-text rubik white" ]
        [ headerView model.navBar
        , main_
            [ class "flex-auto flex flex-row-l flex-wrap flex-nowrap-l overflow-auto" ]
            [ asideView model
            , div
                [ class "flex-auto relative overflow-auto" ]
                [ div
                    [ class <| "f1 flex items-center justify-center fw7 vh-100 parallax lg-sea-salt" ++ " tidexx" ]
                    [ text "WORK" ]
                , div
                    [ class <| "f1 flex items-center justify-center fw7 vh-100 parallax lg-mellow-yellow" ++ " tidexx" ]
                    [ text "BLOG" ]
                , div
                    [ class <| "f1 flex items-center justify-center fw7 vh-100 parallax lg-ooey-gooey" ++ " tidexx" ]
                    [ text "PROCESS" ]
                , div
                    [ class <| "f1 flex items-center justify-center fw7 vh-100 parallax lg-par-four" ++ " tidexx" ]
                    [ text "TOOLS" ]
                ]
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
