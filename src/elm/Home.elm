module Home exposing (view)

import HSLuv exposing (..)
import HSLuv.Manipulate
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Events as Events exposing (..)
import Html.Styled.Keyed as Keyed
import InView
import Jackyons as J exposing (..)
import Markdown
import Maybe.Extra
import Type exposing (..)
import Url


view : Model -> List (Html Msg)
view { contacts, projects, blogPosts } =
    [ div
        [ jacky
            [ vh 100, flex, m [ flexColumn ], flexColumnReverse ]
        ]
        [ header
            [ jacky
                [ flexNone, zMax, wp 100, bg <| oColor 0.05 black ]
            ]
            [ div
                [ jacky
                    [ justifyBetween, itemsStretch, flex, overflowAuto ]
                ]
                [ div
                    [ jacky
                        [ dn, m [ flex ], itemsStretch, justifyCenter, act [ bg white ], pv 1 ]
                    ]
                    [ h1
                        [ jacky
                            [ reg [ bg white, c black, ph 3, f 1, fw 7, flex, itemsCenter ]
                            , act [ J.track 1 ]
                            ]
                        ]
                        [ text "Jack H. Peterson" ]
                    ]
                , ul
                    [ jacky
                        [ reg [ flexAuto, flex, justifyCenter, flex, itemsCenter, tc ]
                        , m [ justifyEnd ]
                        ]
                    ]
                    [ hr [ jacky [ hAuto, dn, m [ db ], flexAuto, bg white, mv 1, selfStretch ] ] []
                    , navTab ( "https://icongr.am/clarity/tasks.svg?color=000000", "Work" )
                    , navTab ( "https://icongr.am/clarity/scroll.svg?color=000000", "Blog" )
                    , navTab ( "https://icongr.am/clarity/flow-chart.svg?color=000000", "Process" )
                    , navTab ( "https://icongr.am/clarity/tools.svg?color=000000", "Tools" )
                    ]
                ]
            ]
        , main_
            [ jacky
                [ reg [ flexAuto, flex, flexWrap, overflowAuto ]
                , l [ flexRow, flexNowrap, overflowHidden ]
                ]
            ]
            [ sideBar contacts
            , div
                [ jacky
                    [ flexAuto, relative, overflowAuto, bg <| oColor 0.05 black ]
                ]
                [ -- projectsView [ ( "Projects" , projects ) ] ,
                  section [] <|
                    h3 [ jacky [ sticky, top 0, tc, bg white, z 1, pa 3, J.track 1, J.b <| oColor 0.05 black, fw 7, l [ ml 1 ] ] ]
                        [ text "Blogs" ]
                        :: List.map blogPost blogPosts
                ]
            ]
        ]
    ]


contactBtn : Contact -> Html Msg
contactBtn contact =
    let
        defaultedHue =
            String.length contact.action
                * String.length contact.handle
                * String.length contact.href
                |> remainderBy 360
                |> toFloat

        justHue =
            Maybe.withDefault
                defaultedHue
                contact.hue
    in
    li
        [ jacky
            [ dib, mv 1, ml 1, act [ z 2 ] ]
        ]
        [ a
            [ jacky
                [ reg [ c black, ba, pv 1, ph 2 ]
                , act [ c <| hsluv360 { hue = justHue, saturation = 100, lightness = 50, alpha = 1 } ]

                -- contact.color
                ]
            , class "button"
            , href contact.href
            , target "_blank"
            , title <| contact.action ++ ": " ++ contact.handle
            ]
            [ text contact.name ]
        ]


blogPost : BlogPost -> Html Msg
blogPost { title, maybeTeaser, body } =
    article
        [ jacky
            [ reg [ bg white, ma 1, flex, flexWrap, relative ]
            , l [ mt 0 ]
            ]
        ]
        [ header
            [ jacky
                [ pl 7, pt 7, flexAuto, bg <| oColor 0.05 black, relative ]
            , style "background-image" <| "url('https://source.unsplash.com/1600x900/?" ++ (String.words title |> String.join ",") ++ "')"
            ]
            [ div
                [ jacky
                    [ reg [ o 70, J.tr, absolute, absoluteFill, flex, justifyEnd, itemsEnd, ma 1, flexColumn ]
                    , m [ flexRow ]
                    ]
                ]
                [ span
                    [ jacky
                        [ bg white, ph 2, pv 1, dib, ma 1 ]
                    ]
                    [ text <| timeToRead body ]
                , span
                    [ jacky
                        [ bg white, ph 2, pv 1, dib, ma 1 ]
                    ]
                    [ text "9/5/2018" ]
                , span
                    [ jacky
                        [ bg white, ph 2, pv 1, dib, ma 1 ]
                    ]
                    [ text "Jack H. Peterson" ]
                ]
            ]
        , main_
            [ jacky
                [ l [ ph 5 ]
                , m [ ph 4 ]
                , reg [ pa 3, center, mwch 50 ]
                ]
            ]
            [ h1 [ jacky [ J.track 1, lh 2, fw 5, f 2 ] ]
                [ text title ]
            , case maybeTeaser of
                Nothing ->
                    text ""

                Just teaser ->
                    p
                        [ jacky
                            [ lh 3, o 80, mt 2 ]
                        ]
                        [ text teaser ]
            ]
        ]


timeToRead : String -> String
timeToRead body =
    -- https://www.quora.com/What-is-average-words-per-minute-a-person-can-read
    String.words body
        |> List.length
        |> (\x ->
                case x // 300 of
                    0 ->
                        "quick read"

                    1 ->
                        "1 minute read"

                    _ ->
                        (String.fromInt <| x // 300) ++ " minute read"
           )



-- project : Project -> Html Msg
-- project { name } =
--     li
--         [ jacky
--             [ flexAuto, relative, overflowHidden, c white, bg <| oColor 20 black ]
--         , style "background-image" "url('https://source.unsplash.com/1600x900/?work')"
--         ]
--         [ div
--             [ jacky
--                 [ dib, pl 6, pr 7, aspectRatio, aspectRatio16x9 ]
--             ]
--             []
--         , a
--             [ jacky
--                 [ fw 6, J.track 1, c white, absolute, absoluteFill, flex, itemsCenter, justifyCenter, bg <| oColor 30 black, o 70 ]
--             , href <| "https://" ++ name
--             ]
--             [ text name ]
--         ]
-- projectsView : List ( String, List Project ) -> Html Msg
-- projectsView projectCategoryList =
--     section [ jacky [ tc ] ] <|
--         List.map
--             (\( category, projects ) ->
--                 article
--                     [ jacky
--                         [ reg [ bg white, pt 1, ml 1 ]
--                         , l [ mt 0 ]
--                         ]
--                     ]
--                     [ h3 [ jacky [] ] [ text category ]
--                     , ul
--                         [ jacky
--                             [ flex, flexWrapReverse ]
--                         ]
--                       <|
--                         List.map project projects
--                     ]
--             )
--             projectCategoryList


navTab : ( String, String ) -> Html Msg
navTab ( icon, name ) =
    li
        [ jacky
            [ reg [ flexAuto, bg transparent, overflowHidden, pv 1 ]
            , m [ flexNone ]
            , act [ bg white, J.track 1 ]
            ]
        ]
        [ a
            [ jacky
                [ c black, bg white, pa 3, flex, justifyCenter, itemsCenter ]
            , href "https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcP4RJE7VTAfe?si=6_quKdD6QyeuEFBuPFwsRQ"
            , target "_blank"
            ]
            [ span
                [ jacky
                    [ pa 2, pt 1, pl 1, contain, ma 2 ]
                , style "background-image" <| "url('" ++ icon ++ "')"
                ]
                []
            , text name
            ]
        ]


sideBar : List Contact -> Html Msg
sideBar contacts =
    aside
        [ jacky
            [ reg [ center, pa 3, flex, flexWrap, justifyAround, itemsCenter ]
            , m [ ma 3 ]
            , l [ flexGrow1, flexShrink0, ma 4, mwch 40 ]
            ]
        ]
        [ header [ jacky [ flex, flexWrap, itemsCenter, justifyCenter ] ]
            [ div
                [ jacky
                    [ ma 2, flexNone, bg <| oColor 0.05 black, cr100, relative, overflowHidden ]
                ]
                [ div
                    [ jacky
                        [ pa 4, pt 5, pl 5, ma 1, c white, cr100, ba, bw 1 ]
                    , style "background-image" "url('https://pbs.twimg.com/profile_images/921053650880839680/MxHCQiO0_400x400.jpg')"
                    ]
                    []
                ]
            , ul [ jacky [ selfCenter, pl 1, ma 2, fw 4, flexNone, measure, bg <| oColor 0.05 black ] ] <|
                List.map
                    (\x ->
                        li [ jacky [ bg white, ph 3, pv 2 ] ]
                            [ text x ]
                    )
                    [ "Create with purpose.", "Design with intent.", "Develop with confidence." ]
            ]
        , section
            [ jacky
                [ reg [ lh 1, flexNone, mv 3, mh 0, flex, flexColumn, itemsStretch ], m [ mh 3 ] ]
            ]
            [ h2
                [ jacky
                    [ selfCenter, f 3, fw 7, J.track 1, act [ J.track 2 ], bg white, c black ]
                ]
                [ span [] [ text "Jack H." ]
                , span [] [ text "Peterson" ]
                ]
            , hr
                [ jacky
                    [ pt 1, mv 2, bg <| oColor 0.05 black ]
                ]
                []
            , ul [ jacky [ lh 3, flex, mt 1, fw 4, ttu, J.track 1, bg <| oColor 0.05 black ] ]
                [ li [ jacky [ flexAuto, tc, bg white, ph 2, act [ J.track 2 ] ] ]
                    [ text "Designer" ]
                , li [ jacky [ mh 1, flexAuto, tc, bg white, ph 2, act [ J.track 2 ] ] ]
                    [ text "Developer" ]
                , li [ jacky [ flexAuto, tc, bg white, ph 2, act [ J.track 2 ] ] ]
                    [ text "Creative" ]
                ]
            ]
        , section
            [ jacky
                [ flexAuto, ma 2, measure, m [ ma 3 ] ]
            ]
            [ h3
                [ jacky
                    [ flexAuto, fw 7, mh 2, mv 2, bb, ph 0, pv 1, J.track 1, J.b <| oColor 0.05 black, bw 1 ]
                ]
                [ text "About" ]
            , p
                [ jacky
                    [ mh 2, mv 0, pa 0, lh 3 ]
                ]
                [ text "Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur distinctio corrupti, architecto temporalabore laudantiumducimus quis excepturi sequi deleniti repudiandae amet dolorem repellendus minima vitae atque quos illo esse." ]
            ]
        , section
            [ jacky
                [ flexAuto, m [ ma 3 ], ma 2, measure, relative ]
            ]
            [ h3 [ jacky [ flexAuto, fw 7, mh 2, mv 2, bb, ph 0, pv 1, J.track 1, bg white, J.b <| oColor 0.05 black, bw 1 ] ]
                [ text "Contact" ]
            , ul
                [ jacky
                    [ lh 2, mh 1, fw 7, f -1 ]
                ]
              <|
                List.map contactBtn contacts
            ]
        ]
