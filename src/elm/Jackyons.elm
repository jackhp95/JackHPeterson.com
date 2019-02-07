module Jackyons exposing (absolute, absoluteFill, act, appearanceNone, aspectRatio, aspectRatio16x9, aspectRatio1x1, aspectRatio3x4, aspectRatio4x3, aspectRatio4x6, aspectRatio5x7, aspectRatio5x8, aspectRatio6x4, aspectRatio7x5, aspectRatio8x5, aspectRatio9x16, aspectRatioobject, b, bDashed, bDotted, bInherit, bNone, bSolid, ba, bb, bb0, bg, bgBottom, bgCenter, bgInherit, bgLeft, bgRight, bgTop, bl, bl0, black, bn, bold, bottom, br, br0, bt, bt0, bullet, bw, bwScale, c, center, chMin, clip, code, collapse, contain, contentAround, contentBetween, contentCenter, contentEnd, contentStart, contentStretch, courier, cover, cr, cr100, crBottom, crLeft, crPill, crRight, crScale, crTop, db, di, dib, dit, dn, dt, dtColumn, dtColumnGroup, dtFixed, dtRow, dtRowGroup, dtc, f, fixed, flex, flexAuto, flexColumn, flexColumnReverse, flexGrow0, flexGrow1, flexNone, flexNowrap, flexRow, flexRowReverse, flexShrink0, flexShrink1, flexWrap, flexWrapReverse, fsNormal, fw, gap, gpu, grid, hAuto, hInherit, hp, hpMin, hs, hsMin, hsluvToCssString, i, indent, inlineFlex, itemsBaseline, itemsCenter, itemsEnd, itemsStart, itemsStretch, jacky, justifyAround, justifyBetween, justifyCenter, justifyEnd, justifyStart, l, leadingScale, left, lengthScale, lh, link, m, ma, mb, measure, measureNarrow, measureWide, mh, ml, mlAuto, mr, mrAuto, mt, mv, mvh, mwNone, mwch, mwp, mws, na, nb, nh, nl, noUnderline, normal, nowrap, nr, nt, number, nv, o, oColor, order, outline, outline0, outlineTransparent, overflowAuto, overflowContainer, overflowHidden, overflowScroll, overflowVisible, overflowXauto, overflowXhidden, overflowXscroll, overflowXvisible, overflowYauto, overflowYhidden, overflowYscroll, overflowYvisible, pa, pb, percent, ph, pl, pr, pre, pt, pv, recursiveAdding, reg, relative, right, rotate, sansSerif, selfBaseline, selfCenter, selfEnd, selfStart, selfStretch, serif, shadow, shadowScale, smallCaps, spacingScale, static, sticky, strike, stripeDark, stripeLight, systemSansSerif, systemSerif, tc, textShadow, tj, tl, top, tr, track, trackScale, transparent, truncate, ttc, ttl, ttn, ttu, typeScale, underline, vBase, vBtm, vMid, vTop, vh, vhMin, wAuto, wThird, wTwoThirds, wch, white, wp, wpMin, ws, wsMin, wsNormal, z, zInherit, zInitial, zMax, zUnset)

import Color
import Css exposing (..)
import Css.Media exposing (..)
import HSLuv exposing (..)
import HSLuv.Manipulate exposing (..)
import Html.Styled exposing (Attribute)
import Html.Styled.Attributes exposing (css)


jacky : List Style -> Attribute msg
jacky =
    css


reg : List Style -> Style
reg =
    batch


act : List Style -> Style
act list =
    batch [ Css.hover list, Css.focus list ]



-- COLORS


black : HSLuv
black =
    hsluv360
        { hue = 300
        , saturation = 0
        , lightness = 0
        , alpha = 1
        }


white : HSLuv
white =
    hsluv360
        { hue = 300
        , saturation = 0
        , lightness = 100
        , alpha = 1
        }


transparent : HSLuv
transparent =
    hsluv360
        { hue = 300
        , saturation = 0
        , lightness = 0
        , alpha = 0
        }


hsluvToCssString : HSLuv -> String
hsluvToCssString val =
    toColor val
        |> Color.toCssString


oColor : Float -> HSLuv -> HSLuv
oColor =
    setAlpha



-- MEDIA QUERIES


m : List Style -> Style
m list =
    withMediaQuery
        [ "screen and (min-width:30em)" ]
        list


l : List Style -> Style
l list =
    withMediaQuery
        [ "screen and (min-width:60em)" ]
        list



-- SCALES --


recursiveAdding : Float -> Int -> Float
recursiveAdding scale val =
    case abs val of
        0 ->
            0

        1 ->
            -- Clever way to make the scale subtract if needed.
            scale * toFloat val

        _ ->
            recursiveAdding (scale + scale) <|
                case val == abs val of
                    True ->
                        val - 1

                    False ->
                        val + 1


percent : Int -> String
percent val =
    String.fromInt val ++ "%"


crScale : Int -> String
crScale val =
    recursiveAdding 0.125 val
        |> String.fromFloat
        |> (\x -> x ++ "rem")


bwScale : Int -> String
bwScale val =
    recursiveAdding 0.25 val
        |> String.fromFloat
        |> (\x -> x ++ "rem")


shadowScale : Float -> HSLuv -> Int -> String
shadowScale strength color val =
    let
        printColor x =
            color
                |> setAlpha (x / strength)
                |> hsluvToCssString
    in
    recursiveAdding 0.25 val
        |> (\x ->
                "0 0 "
                    ++ String.fromFloat x
                    ++ "rem  "
                    ++ printColor x
           )


spacingScale : Int -> String
spacingScale val =
    recursiveAdding 0.25 val
        |> String.fromFloat
        |> (\x -> x ++ "rem")


lengthScale : Int -> String
lengthScale val =
    recursiveAdding 0.25 val
        |> String.fromFloat
        |> (\x -> x ++ "rem")


trackScale : Int -> String
trackScale val =
    recursiveAdding 0.0625 val
        |> String.fromFloat
        |> (\x -> x ++ "ch")


leadingScale : Int -> String
leadingScale val =
    recursiveAdding 0.125 val
        |> (\x -> x + 1)
        |> String.fromFloat


typeScale : Int -> String
typeScale val =
    recursiveAdding 0.2360679775 val
        |> (\x -> x + 1)
        |> String.fromFloat
        |> (\x -> x ++ "rem")



-- EXPOSED


gpu : Style
gpu =
    Css.batch
        [ property "transform" "translateZ(0)"
        , property "-webkit-transform" "translateZ(0)"
        ]


aspectRatio : Style
aspectRatio =
    Css.batch
        [ property "height" "0"
        , property "position" "relative"
        ]


aspectRatio16x9 : Style
aspectRatio16x9 =
    Css.batch
        [ property "padding-bottom" "56.25%" ]


aspectRatio9x16 : Style
aspectRatio9x16 =
    Css.batch
        [ property "padding-bottom" "177.77%" ]


aspectRatio4x3 : Style
aspectRatio4x3 =
    Css.batch
        [ property "padding-bottom" "75%" ]


aspectRatio3x4 : Style
aspectRatio3x4 =
    Css.batch
        [ property "padding-bottom" "133.33%" ]


aspectRatio6x4 : Style
aspectRatio6x4 =
    Css.batch
        [ property "padding-bottom" "66.6%" ]


aspectRatio4x6 : Style
aspectRatio4x6 =
    Css.batch
        [ property "padding-bottom" "150%" ]


aspectRatio8x5 : Style
aspectRatio8x5 =
    Css.batch
        [ property "padding-bottom" "62.5%" ]


aspectRatio5x8 : Style
aspectRatio5x8 =
    Css.batch
        [ property "padding-bottom" "160%" ]


aspectRatio7x5 : Style
aspectRatio7x5 =
    Css.batch
        [ property "padding-bottom" "71.42%" ]


aspectRatio5x7 : Style
aspectRatio5x7 =
    Css.batch
        [ property "padding-bottom" "140%" ]


aspectRatio1x1 : Style
aspectRatio1x1 =
    Css.batch
        [ property "padding-bottom" "100%" ]


aspectRatioobject : Style
aspectRatioobject =
    Css.batch
        [ property "position" "absolute"
        , property "top" "0"
        , property "right" "0"
        , property "bottom" "0"
        , property "left" "0"
        , property "width" "100%"
        , property "height" "100%"
        , property "z-index" "100"
        ]


cover : Style
cover =
    Css.batch
        [ property "background-size" "cover!important"
        , property "object-fit" "cover!important"
        ]


contain : Style
contain =
    Css.batch
        [ property "background-size" "contain!important"
        , property "object-fit" "contain!important"
        ]


bgCenter : Style
bgCenter =
    Css.batch
        [ property "background-position" "50%" ]


bgTop : Style
bgTop =
    Css.batch
        [ property "background-position" "top" ]


bgRight : Style
bgRight =
    Css.batch
        [ property "background-position" "100%" ]


bgBottom : Style
bgBottom =
    Css.batch
        [ property "background-position" "bottom" ]


bgLeft : Style
bgLeft =
    Css.batch
        [ property "background-position" "0" ]


outline : Style
outline =
    Css.batch
        [ property "outline" "1px solid" ]


outlineTransparent : Style
outlineTransparent =
    Css.batch
        [ property "outline" "1px solid transparent" ]


outline0 : Style
outline0 =
    Css.batch
        [ property "outline" "0" ]


ba : Style
ba =
    Css.batch
        [ property "border-style" "solid"
        , property "border-width" "1px"
        ]


bt : Style
bt =
    Css.batch
        [ property "border-top-style" "solid"
        , property "border-top-width" "1px"
        ]


br : Style
br =
    Css.batch
        [ property "border-right-style" "solid"
        , property "border-right-width" "1px"
        ]


bb : Style
bb =
    Css.batch
        [ property "border-bottom-style" "solid"
        , property "border-bottom-width" "1px"
        ]


bl : Style
bl =
    Css.batch
        [ property "border-left-style" "solid"
        , property "border-left-width" "1px"
        ]


bn : Style
bn =
    Css.batch
        [ property "border-style" "none"
        , property "border-width" "0"
        ]


cr : Int -> Style
cr val =
    Css.batch
        [ property "border-radius" <| crScale val ]


cr100 : Style
cr100 =
    Css.batch
        [ property "border-radius" "100%" ]


crPill : Style
crPill =
    Css.batch
        [ property "border-radius" "9999px" ]


crBottom : Style
crBottom =
    Css.batch
        [ property "border-top-left-radius" "0"
        , property "border-top-right-radius" "0"
        ]


crTop : Style
crTop =
    Css.batch
        [ property "border-bottom-right-radius" "0"
        , property "border-bottom-left-radius" "0"
        ]


crRight : Style
crRight =
    Css.batch
        [ property "border-bottom-left-radius" "0"
        , property "border-top-left-radius" "0"
        ]


crLeft : Style
crLeft =
    Css.batch
        [ property "border-top-right-radius" "0"
        , property "border-bottom-right-radius" "0"
        ]


bDotted : Style
bDotted =
    Css.batch
        [ property "border-style" "dotted" ]


bDashed : Style
bDashed =
    Css.batch
        [ property "border-style" "dashed" ]


bSolid : Style
bSolid =
    Css.batch
        [ property "border-style" "solid" ]


bNone : Style
bNone =
    Css.batch
        [ property "border-style" "none" ]


bw : Int -> Style
bw val =
    Css.batch
        [ property "border-width" <| bwScale val ]


bt0 : Style
bt0 =
    Css.batch
        [ property "border-top-width" "0" ]


br0 : Style
br0 =
    Css.batch
        [ property "border-right-width" "0" ]


bb0 : Style
bb0 =
    Css.batch
        [ property "border-bottom-width" "0" ]


bl0 : Style
bl0 =
    Css.batch
        [ property "border-left-width" "0" ]


shadow : HSLuv -> Int -> Style
shadow color val =
    Css.batch
        [ property "box-shadow" <| shadowScale 4 color val ]


textShadow : HSLuv -> Int -> Style
textShadow color val =
    Css.batch
        [ property "text-shadow" <| shadowScale 1 color val ]


top : Int -> Style
top val =
    Css.batch
        [ property "top" <| spacingScale val ]


right : Int -> Style
right val =
    Css.batch
        [ property "right" <| spacingScale val ]


bottom : Int -> Style
bottom val =
    Css.batch
        [ property "bottom" <| spacingScale val ]


left : Int -> Style
left val =
    Css.batch
        [ property "left" <| spacingScale val ]


absoluteFill : Style
absoluteFill =
    Css.batch
        [ property "top" "0"
        , property "right" "0"
        , property "bottom" "0"
        , property "left" "0"
        ]


dn : Style
dn =
    Css.batch
        [ property "display" "none" ]


di : Style
di =
    Css.batch
        [ property "display" "inline" ]


db : Style
db =
    Css.batch
        [ property "display" "block" ]


dib : Style
dib =
    Css.batch
        [ property "display" "inline-block" ]


dit : Style
dit =
    Css.batch
        [ property "display" "inline-table" ]


dt : Style
dt =
    Css.batch
        [ property "display" "table" ]


dtc : Style
dtc =
    Css.batch
        [ property "display" "table-cell" ]


dtRow : Style
dtRow =
    Css.batch
        [ property "display" "table-row" ]


dtRowGroup : Style
dtRowGroup =
    Css.batch
        [ property "display" "table-row-group" ]


dtColumn : Style
dtColumn =
    Css.batch
        [ property "display" "table-column" ]


dtColumnGroup : Style
dtColumnGroup =
    Css.batch
        [ property "display" "table-column-group" ]


dtFixed : Style
dtFixed =
    Css.batch
        [ property "table-layout" "fixed"
        , property "width" "100%"
        ]


grid : Int -> Style
grid val =
    Css.batch
        [ property "display" "grid"
        , property "grid" <|
            "auto-flow dense / repeat(auto-fit, minmax("
                ++ lengthScale val
                ++ ", 1fr))"
        ]


gap : Int -> Style
gap val =
    Css.batch
        [ property "grid-gap" <| spacingScale val
        , property "gap" <| spacingScale val
        ]



-- = Css.batch [ property "grid-gap" "1rem"]
-- = Css.batch [ property "grid-template-columns" "repeat(1fr)"]
-- = Css.batch [ property "grid-auto-rows" "4rem"]
-- = Css.batch [ property "grid-auto-flow" "dense"]


flex : Style
flex =
    Css.batch
        [ property "display" "flex" ]


inlineFlex : Style
inlineFlex =
    Css.batch
        [ property "display" "inline-flex" ]


flexAuto : Style
flexAuto =
    Css.batch
        [ property "flex" "1 1 auto"
        , property "min-width" "0"
        , property "min-height" "0"
        ]


flexNone : Style
flexNone =
    Css.batch
        [ property "flex" "none" ]


flexColumn : Style
flexColumn =
    Css.batch
        [ property "flex-direction" "column" ]


flexRow : Style
flexRow =
    Css.batch
        [ property "flex-direction" "row" ]


flexWrap : Style
flexWrap =
    Css.batch
        [ property "flex-wrap" "wrap" ]


flexNowrap : Style
flexNowrap =
    Css.batch
        [ property "flex-wrap" "nowrap" ]


flexWrapReverse : Style
flexWrapReverse =
    Css.batch
        [ property "flex-wrap" "wrap-reverse" ]


flexColumnReverse : Style
flexColumnReverse =
    Css.batch
        [ property "flex-direction" "column-reverse" ]


flexRowReverse : Style
flexRowReverse =
    Css.batch
        [ property "flex-direction" "row-reverse" ]


itemsStart : Style
itemsStart =
    Css.batch
        [ property "align-items" "flex-start" ]


itemsEnd : Style
itemsEnd =
    Css.batch
        [ property "align-items" "flex-end" ]


itemsCenter : Style
itemsCenter =
    Css.batch
        [ property "align-items" "center" ]


itemsBaseline : Style
itemsBaseline =
    Css.batch
        [ property "align-items" "baseline" ]


itemsStretch : Style
itemsStretch =
    Css.batch
        [ property "align-items" "stretch" ]


selfStart : Style
selfStart =
    Css.batch
        [ property "align-self" "flex-start" ]


selfEnd : Style
selfEnd =
    Css.batch
        [ property "align-self" "flex-end" ]


selfCenter : Style
selfCenter =
    Css.batch
        [ property "align-self" "center" ]


selfBaseline : Style
selfBaseline =
    Css.batch
        [ property "align-self" "baseline" ]


selfStretch : Style
selfStretch =
    Css.batch
        [ property "align-self" "stretch" ]


justifyStart : Style
justifyStart =
    Css.batch
        [ property "justify-content" "flex-start" ]


justifyEnd : Style
justifyEnd =
    Css.batch
        [ property "justify-content" "flex-end" ]


justifyCenter : Style
justifyCenter =
    Css.batch
        [ property "justify-content" "center" ]


justifyBetween : Style
justifyBetween =
    Css.batch
        [ property "justify-content" "space-between" ]


justifyAround : Style
justifyAround =
    Css.batch
        [ property "justify-content" "space-around" ]


contentStart : Style
contentStart =
    Css.batch
        [ property "align-content" "flex-start" ]


contentEnd : Style
contentEnd =
    Css.batch
        [ property "align-content" "flex-end" ]


contentCenter : Style
contentCenter =
    Css.batch
        [ property "align-content" "center" ]


contentBetween : Style
contentBetween =
    Css.batch
        [ property "align-content" "space-between" ]


contentAround : Style
contentAround =
    Css.batch
        [ property "align-content" "space-around" ]


contentStretch : Style
contentStretch =
    Css.batch
        [ property "align-content" "stretch" ]


order : Int -> Style
order val =
    Css.batch
        [ property "order" <| String.fromInt val ]


flexGrow0 : Style
flexGrow0 =
    Css.batch
        [ property "flex-grow" "0" ]


flexGrow1 : Style
flexGrow1 =
    Css.batch
        [ property "flex-grow" "1" ]


flexShrink0 : Style
flexShrink0 =
    Css.batch
        [ property "flex-shrink" "0" ]


flexShrink1 : Style
flexShrink1 =
    Css.batch
        [ property "flex-shrink" "1" ]


sansSerif : Style
sansSerif =
    Css.batch
        [ property "font-family" "-apple-system,BlinkMacSystemFont,avenir next,avenir,helvetica neue,helvetica,ubuntu,roboto,noto,segoe ui,arial,sans-serif" ]


serif : Style
serif =
    Css.batch
        [ property "font-family" "georgia,times,serif" ]


systemSansSerif : Style
systemSansSerif =
    Css.batch
        [ property "font-family" "sans-serif" ]


systemSerif : Style
systemSerif =
    Css.batch
        [ property "font-family" "serif" ]


code : Style
code =
    Css.batch
        [ property "font-family" "Consolas,monaco,monospace" ]


courier : Style
courier =
    Css.batch
        [ property "font-family" "Courier Next,courier,monospace" ]


i : Style
i =
    Css.batch
        [ property "font-style" "italic" ]


fsNormal : Style
fsNormal =
    Css.batch
        [ property "font-style" "normal" ]


normal : Style
normal =
    Css.batch
        [ property "font-weight" "400" ]


bold : Style
bold =
    Css.batch
        [ property "font-weight" "700" ]


fw : Int -> Style
fw val =
    Css.batch
        [ property "font-weight" <| String.fromInt <| val * 100 ]


appearanceNone : Style
appearanceNone =
    Css.batch
        [ property "-webkit-appearance" "none"
        , property "-moz-appearance" "none"
        , property "border" "0"
        , property "padding" "0"
        ]


hs : Int -> Style
hs val =
    Css.batch
        [ property "height" <| lengthScale val ]


hsMin : Int -> Style
hsMin val =
    Css.batch
        [ property "min-height" <| lengthScale val ]


hp : Int -> Style
hp val =
    Css.batch
        [ property "height" <| percent val ]


mvh : Int -> Style
mvh val =
    Css.batch
        [ property "max-height" <| String.fromInt val ++ "vh" ]


hpMin : Int -> Style
hpMin val =
    Css.batch
        [ property "min-height" <| percent val ]


vh : Int -> Style
vh val =
    Css.batch
        [ property "height" <| String.fromInt val ++ "vh" ]


vhMin : Int -> Style
vhMin val =
    Css.batch
        [ property "min-height" <| String.fromInt val ++ "vh" ]


hAuto : Style
hAuto =
    Css.batch
        [ property "height" "auto" ]


hInherit : Style
hInherit =
    Css.batch
        [ property "height" "inherit" ]


track : Int -> Style
track val =
    Css.batch
        [ property "letter-spacing" <| trackScale val ]


lh : Int -> Style
lh val =
    Css.batch
        [ property "line-height" <| leadingScale val ]


link : HSLuv -> Style
link color =
    Css.batch
        [ property "cursor" "pointer"
        , property "-webkit-user-drag" "none"
        , property "-webkit-tap-highlight-color" "transparent"
        , property "-webkit-tap-highlight-color" "transparent"
        , property "transition-property" "background-color, box-shadow, border-color"
        , Css.link
            [ property "color" <| hsluvToCssString color ]
        , visited
            [ property "color" <| hsluvToCssString <| setAlpha 0.4 color ]
        , Css.hover
            [ property "text-decoration-color" <| hsluvToCssString <| setAlpha 0.6 color ]
        , focus
            [ property "text-decoration-color" <| hsluvToCssString <| setAlpha 0.8 color ]
        , Css.hover
            [ focus
                [ property "text-decoration" "underline"
                , property "text-decoration-skip" "ink"
                , property "text-decoration-skip-ink" "auto"
                , property "-webkit-text-decoration-skip" "objects"
                ]
            ]
        ]


bullet : Style
bullet =
    Css.batch
        [ property "list-style-type" "disc" ]


number : Style
number =
    Css.batch
        [ property "list-style-type" "decimal" ]


mwp : Int -> Style
mwp val =
    Css.batch
        [ property "max-width" <| percent val ]


mwch : Int -> Style
mwch val =
    Css.batch
        [ property "max-width" <| String.fromInt val ++ "ch" ]


mws : Int -> Style
mws val =
    Css.batch
        [ property "max-width" <| lengthScale val ]


mwNone : Style
mwNone =
    Css.batch
        [ property "max-width" "none" ]


wch : Int -> Style
wch val =
    Css.batch
        [ property "width" <| String.fromInt val ++ "ch" ]


ws : Int -> Style
ws val =
    Css.batch
        [ property "width" <| lengthScale val ]


wp : Int -> Style
wp val =
    Css.batch
        [ property "width" <| percent val ]


wsMin : Int -> Style
wsMin val =
    Css.batch
        [ property "min-width" <| lengthScale val ]


wpMin : Int -> Style
wpMin val =
    Css.batch
        [ property "min-width" <| percent val ]


chMin : Int -> Style
chMin val =
    Css.batch
        [ property "min-width" <| String.fromInt val ++ "ch" ]


wThird : Style
wThird =
    Css.batch
        [ property "width" "33.33333%" ]


wTwoThirds : Style
wTwoThirds =
    Css.batch
        [ property "width" "66.66667%" ]


wAuto : Style
wAuto =
    Css.batch
        [ property "width" "auto" ]


overflowVisible : Style
overflowVisible =
    Css.batch
        [ property "overflow" "visible" ]


overflowHidden : Style
overflowHidden =
    Css.batch
        [ property "overflow" "hidden" ]


overflowScroll : Style
overflowScroll =
    Css.batch
        [ property "overflow" "scroll" ]


overflowAuto : Style
overflowAuto =
    Css.batch
        [ property "overflow" "auto" ]


overflowXvisible : Style
overflowXvisible =
    Css.batch
        [ property "overflow-x" "visible" ]


overflowXhidden : Style
overflowXhidden =
    Css.batch
        [ property "overflow-x" "hidden" ]


overflowXscroll : Style
overflowXscroll =
    Css.batch
        [ property "overflow-x" "scroll" ]


overflowXauto : Style
overflowXauto =
    Css.batch
        [ property "overflow-x" "auto" ]


overflowYvisible : Style
overflowYvisible =
    Css.batch
        [ property "overflow-y" "visible" ]


overflowYhidden : Style
overflowYhidden =
    Css.batch
        [ property "overflow-y" "hidden" ]


overflowYscroll : Style
overflowYscroll =
    Css.batch
        [ property "overflow-y" "scroll" ]


overflowYauto : Style
overflowYauto =
    Css.batch
        [ property "overflow-y" "auto" ]


static : Style
static =
    Css.batch
        [ property "position" "static" ]


relative : Style
relative =
    Css.batch
        [ property "position" "relative" ]


absolute : Style
absolute =
    Css.batch
        [ property "position" "absolute" ]


fixed : Style
fixed =
    Css.batch
        [ property "position" "fixed" ]


sticky : Style
sticky =
    Css.batch
        [ property "position" "sticky"
        , property "position" "-webkit-sticky"
        ]


o : Float -> Style
o val =
    Css.batch
        [ property "opacity" <| String.fromFloat (val / 100) ]


rotate : Float -> Style
rotate val =
    Css.batch
        [ property "-webkit-transform" <| String.fromFloat val ++ "deg"
        , property "transform" <| String.fromFloat val ++ "deg"
        ]


c : HSLuv -> Style
c val =
    Css.batch
        [ property "color" <| hsluvToCssString val ]


bg : HSLuv -> Style
bg val =
    Css.batch
        [ property "background-color" <| hsluvToCssString val ]


b : HSLuv -> Style
b val =
    Css.batch
        [ property "border-color" <| hsluvToCssString val ]


bgInherit : Style
bgInherit =
    Css.batch
        [ property "background-color" "inherit" ]


bInherit : Style
bInherit =
    Css.batch
        [ property "border-color" "transparent" ]


pa : Int -> Style
pa val =
    Css.batch [ property "padding" <| spacingScale val ]


pl : Int -> Style
pl val =
    Css.batch [ property "padding-left" <| spacingScale val ]


pr : Int -> Style
pr val =
    Css.batch [ property "padding-right" <| spacingScale val ]


pt : Int -> Style
pt val =
    Css.batch [ property "padding-top" <| spacingScale val ]


pb : Int -> Style
pb val =
    Css.batch [ property "padding-bottom" <| spacingScale val ]


pv : Int -> Style
pv val =
    Css.batch
        [ property "padding-top" <| spacingScale val
        , property "padding-bottom" <| spacingScale val
        ]


ph : Int -> Style
ph val =
    Css.batch
        [ property "padding-left" <| spacingScale val
        , property "padding-right" <| spacingScale val
        ]


ma : Int -> Style
ma val =
    Css.batch [ property "margin" <| spacingScale val ]


ml : Int -> Style
ml val =
    Css.batch [ property "margin-left" <| spacingScale val ]


mr : Int -> Style
mr val =
    Css.batch [ property "margin-right" <| spacingScale val ]


mt : Int -> Style
mt val =
    Css.batch [ property "margin-top" <| spacingScale val ]


mb : Int -> Style
mb val =
    Css.batch [ property "margin-bottom" <| spacingScale val ]


mv : Int -> Style
mv val =
    Css.batch
        [ property "margin-top" <| spacingScale val
        , property "margin-bottom" <| spacingScale val
        ]


mh : Int -> Style
mh val =
    Css.batch
        [ property "margin-left" <| spacingScale val
        , property "margin-right" <| spacingScale val
        ]


na : Int -> Style
na val =
    Css.batch [ property "margin" <| spacingScale -val ]


nl : Int -> Style
nl val =
    Css.batch [ property "margin-left" <| spacingScale -val ]


nr : Int -> Style
nr val =
    Css.batch [ property "margin-right" <| spacingScale -val ]


nt : Int -> Style
nt val =
    Css.batch [ property "margin-top" <| spacingScale -val ]


nb : Int -> Style
nb val =
    Css.batch [ property "margin-bottom" <| spacingScale -val ]


nv : Int -> Style
nv val =
    Css.batch
        [ property "margin-top" <| spacingScale -val
        , property "margin-bottom" <| spacingScale -val
        ]


nh : Int -> Style
nh val =
    Css.batch
        [ property "margin-left" <| spacingScale -val
        , property "margin-right" <| spacingScale -val
        ]


collapse : Style
collapse =
    Css.batch
        [ property "border-collapse" "collapse"
        , property "border-spacing" "0"
        ]


stripeLight : Style
stripeLight =
    nthChild "odd"
        [ property "background-color" "hsla(0,0%,100%,.1)" ]


stripeDark : Style
stripeDark =
    nthChild "odd"
        [ property "background-color" "rgba(0,0,0,.1)" ]


strike : Style
strike =
    Css.batch
        [ property "text-decoration" "line-through" ]


underline : Style
underline =
    Css.batch
        [ property "text-decoration" "underline" ]


noUnderline : Style
noUnderline =
    Css.batch
        [ property "text-decoration" "none" ]


tl : Style
tl =
    Css.batch
        [ property "text-align" "left" ]


tr : Style
tr =
    Css.batch
        [ property "text-align" "right" ]


tc : Style
tc =
    Css.batch
        [ property "text-align" "center" ]


tj : Style
tj =
    Css.batch
        [ property "text-align" "justify" ]


ttc : Style
ttc =
    Css.batch
        [ property "text-transform" "capitalize" ]


ttl : Style
ttl =
    Css.batch
        [ property "text-transform" "lowercase" ]


ttu : Style
ttu =
    Css.batch
        [ property "text-transform" "uppercase" ]


ttn : Style
ttn =
    Css.batch
        [ property "text-transform" "none" ]


f : Int -> Style
f val =
    Css.batch
        [ property "font-size" <| typeScale val ]


measure : Style
measure =
    Css.batch
        [ property "max-width" "30em" ]


measureWide : Style
measureWide =
    Css.batch
        [ property "max-width" "34em" ]


measureNarrow : Style
measureNarrow =
    Css.batch
        [ property "max-width" "20em" ]


indent : Style
indent =
    Css.batch
        [ property "text-indent" "1em"
        , property "margin-top" "0"
        , property "margin-bottom" "0"
        ]


smallCaps : Style
smallCaps =
    Css.batch
        [ property "font-variant" "small-caps" ]


truncate : Style
truncate =
    Css.batch
        [ property "white-space" "nowrap"
        , property "overflow" "hidden"
        , property "text-overflow" "ellipsis"
        ]


overflowContainer : Style
overflowContainer =
    Css.batch
        [ property "overflow-y" "scroll" ]


center : Style
center =
    Css.batch
        [ property "margin-left" "auto"
        , property "margin-right" "auto"
        ]


mrAuto : Style
mrAuto =
    Css.batch
        [ property "margin-right" "auto" ]


mlAuto : Style
mlAuto =
    Css.batch
        [ property "margin-left" "auto" ]


clip : Style
clip =
    Css.batch
        [ property "position" "fixed!important"
        , property "_position" "absolute!important"
        , property "clip" "rect(1px 1px 1px 1px)"
        , property "clip" "rect(1px,1px,1px,1px)"
        ]


wsNormal : Style
wsNormal =
    Css.batch
        [ property "white-space" "normal" ]


nowrap : Style
nowrap =
    Css.batch
        [ property "white-space" "nowrap" ]


pre : Style
pre =
    Css.batch
        [ property "white-space" "pre" ]


vBase : Style
vBase =
    Css.batch
        [ property "vertical-align" "baseline" ]


vMid : Style
vMid =
    Css.batch
        [ property "vertical-align" "middle" ]


vTop : Style
vTop =
    Css.batch
        [ property "vertical-align" "top" ]


vBtm : Style
vBtm =
    Css.batch
        [ property "vertical-align" "bottom" ]



-- ACTIVE --
-- dim : Style
-- dim =
--  Css.batch [
--  property "opacity" "1"
--  ]
-- , property "dim,.dim" "focus,.dim" "hover : Style"
-- , property "dim,.dim" "focus,.dim" "hover ="
--  Css.batch [
--  property "transition" "opacity .15s ease-in"
--  ]
-- , property "dim" "focus,.dim" "hover : Style"
-- , property "dim" "focus,.dim" "hover ="
--  Css.batch [
--  property "opacity" ".5"
--  ]
-- , property "dim" "active : Style"
-- , property "dim" "active ="
--  Css.batch [
--  property "opacity" ".8"
-- , property "transition" "opacity .15s ease-out"
--  ]
-- , property "glow,.glow" "focus,.glow" "hover : Style"
-- , property "glow,.glow" "focus,.glow" "hover ="
--  Css.batch [
--  property "transition" "opacity .15s ease-in"
--  ]
-- , property "glow" "focus,.glow" "hover : Style"
-- , property "glow" "focus,.glow" "hover ="
--  Css.batch [
--  property "opacity" "1"
--  ]
-- hide-child .child : Style
-- hide-child .child =
--  Css.batch [
--  property "opacity" "0"
-- , property "transition" "opacity .15s ease-in"
--  ]
-- , property "hide-child" "active .child,.hide-child" "focus .child,.hide-child" "hover .child : Style"
-- , property "hide-child" "active .child,.hide-child" "focus .child,.hide-child" "hover .child ="
--  Css.batch [
--  property "opacity" "1"
-- , property "transition" "opacity .15s ease-in"
--  ]
-- , property "underline-hover" "focus,.underline-hover" "hover : Style"
-- , property "underline-hover" "focus,.underline-hover" "hover ="
--  Css.batch [
--  property "text-decoration" "underline"
--  ]
-- grow : Style
-- grow =
--  Css.batch [
--  property "-moz-osx-font-smoothing" "grayscale"
-- , property "-webkit-backface-visibility" "hidden"
-- , property "backface-visibility" "hidden"
-- , property "-webkit-transform" "translateZ(0)"
-- , property "transform" "translateZ(0)"
-- , property "transition" "-webkit-transform .25s ease-out"
-- , property "transition" "transform .25s ease-out"
-- , property "transition" "transform .25s ease-out,-webkit-transform .25s ease-out"
--  ]
-- , property "grow" "focus,.grow" "hover : Style"
-- , property "grow" "focus,.grow" "hover ="
--  Css.batch [
--  property "-webkit-transform" "scale(1.05)"
-- , property "transform" "scale(1.05)"
--  ]
-- , property "grow" "active : Style"
-- , property "grow" "active ="
--  Css.batch [
--  property "-webkit-transform" "scale(.9)"
-- , property "transform" "scale(.9)"
--  ]
-- grow-large : Style
-- grow-large =
--  Css.batch [
--  property "-moz-osx-font-smoothing" "grayscale"
-- , property "-webkit-backface-visibility" "hidden"
-- , property "backface-visibility" "hidden"
-- , property "-webkit-transform" "translateZ(0)"
-- , property "transform" "translateZ(0)"
-- , property "transition" "-webkit-transform .25s ease-in-out"
-- , property "transition" "transform .25s ease-in-out"
-- , property "transition" "transform .25s ease-in-out,-webkit-transform .25s ease-in-out"
--  ]
-- , property "grow-large" "focus,.grow-large" "hover : Style"
-- , property "grow-large" "focus,.grow-large" "hover ="
--  Css.batch [
--  property "-webkit-transform" "scale(1.2)"
-- , property "transform" "scale(1.2)"
--  ]
-- , property "grow-large" "active : Style"
-- , property "grow-large" "active ="
--  Css.batch [
--  property "-webkit-transform" "scale(.95)"
-- , property "transform" "scale(.95)"
--  ]
-- , property "pointer" "hover,.shadow-hover : Style"
-- , property "pointer" "hover,.shadow-hover ="
--  Css.batch [
--  property "cursor" "pointer"
--  ]
-- shadow-hover : Style
-- shadow-hover =
--  Css.batch [
--  property "position" "relative"
-- , property "transition" "all .5s cubic-bezier(.165,.84,.44,1)"
--  ]
-- , property "shadow-hover" "after : Style"
-- , property "shadow-hover" "after ="
--  Css.batch [
--  property "content" """"
-- , property "box-shadow" "0 0 16px 2px rgba(0,0,0,.2)"
-- , property "border-radius" "inherit"
-- , property "opacity" "0"
-- , property "position" "absolute"
-- , property "top" "0"
-- , property "left" "0"
-- , property "width" "100%"
-- , property "height" "100%"
-- , property "z-index" "-1"
-- , property "transition" "opacity .5s cubic-bezier(.165,.84,.44,1)"
--  ]
-- , property "shadow-hover" "focus" "after,.shadow-hover" "hover" "after : Style"
-- , property "shadow-hover" "focus" "after,.shadow-hover" "hover" "after ="
--  Css.batch [
--  property "opacity" "1"
--  ]
-- , property "bg-animate,.bg-animate" "focus,.bg-animate" "hover : Style"
-- , property "bg-animate,.bg-animate" "focus,.bg-animate" "hover ="
--  Css.batch [
--  property "transition" "background-color .15s ease-in-out"
--  ]


z : Int -> Style
z val =
    Css.batch
        [ property "z-index" <| String.fromInt val ]


zMax : Style
zMax =
    Css.batch
        [ property "z-index" "2147483647" ]


zInherit : Style
zInherit =
    Css.batch
        [ property "z-index" "inherit" ]


zInitial : Style
zInitial =
    Css.batch
        [ property "z-index" "auto" ]


zUnset : Style
zUnset =
    Css.batch
        [ property "z-index" "unset" ]



-- NESTED --
-- nested-copy-line-height ol,.nested-copy-line-height p,.nested-copy-line-height ul : Style
-- nested-copy-line-height ol,.nested-copy-line-height p,.nested-copy-line-height ul =
--  Css.batch [
--  property "line-height" "1.5"
--  ]
-- , nnested-headline-line-height h1,.nested-headline-line-height h2,.nested-headline-line-height h3,.nested-headline-line-height h4,   =.nested-headline-line-height h5,.nested-headline-line-height h" " Stringested-headline-line-height h1,.nested-headline-line-height h2,property "".nested-headline-line-height h3,.nested-headline-line-height h4, =.nested-headline-line-height h5,.nested-headline-line-height h6
--  Css.batch [
--  property "line-height" "1.25"
--  ]
-- nested-list-reset ol,.nested-list-reset ul : Style
-- nested-list-reset ol,.nested-list-reset ul =
--  Css.batch [
--  property "padding-left" "0"
-- , property "margin-left" "0"
-- , property "list-style-type" "none"
--  ]
-- nested-copy-indent p+p : Style
-- nested-copy-indent p+p =
--  Css.batch [
--  property "text-indent" "1em"
-- , property "margin-top" "0"
-- , property "margin-bottom" "0"
--  ]
-- nested-copy-separator p+p : Style
-- nested-copy-separator p+p =
--  Css.batch [
--  property "margin-top" "1.5em"
--  ]
-- nested-img img : Style
-- nested-img img =
--  Css.batch [
--  property "width" "100%"
-- , property "max-width" "100%"
-- , property "display" "block"
--  ]
-- nested-links a : Style
-- nested-links a =
--  Css.batch [
--  property "color" "#357edd"
-- , property "transition" "color .15s ease-in"
--  ]
-- , property "nested-links a" "focus,.nested-links a" "hover : Style"
-- , property "nested-links a" "focus,.nested-links a" "hover ="
--  Css.batch [
--  property "color" "#96ccff"
-- , property "transition" "color .15s ease-in"
--  ]
-- DEBUG --
-- debug * : Style
-- debug * =
--  Css.batch [
--  property "outline" "1px solid gold"
--  ]
-- debug-white * : Style
-- debug-white * =
--  Css.batch [
--  property "outline" "1px solid #fff"
--  ]
-- debug-black * : Style
-- debug-black * =
--  Css.batch [
--  property "outline" "1px solid #000"
--  ]
-- debug-grid : Style
-- debug-grid =
--  Css.batch [
--  property "background" "transparent url(data" "image/png"
-- base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAAFElEQVR4AWPAC97/9x0eCsAEPgwAVLshdpENIxcAAAAASUVORK5CYII=) repeat 0 0
--  ]
-- debug-grid-16 : Style
-- debug-grid-16 =
--  Css.batch [
--  property "background" "transparent url(data" "image/png"
-- base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAMklEQVR4AWOgCLz/b0epAa6UGuBOqQHOQHLUgFEDnAbcBZ4UGwDOkiCnkIhdgNgNxAYAiYlD+8sEuo8AAAAASUVORK5CYII=) repeat 0 0
--  ]
-- debug-grid-8-solid : Style
-- debug-grid-8-solid =
--  Css.batch [
--  property "background" "#fff url(data" "image/gif"
-- base64,R0lGODdhCAAIAPEAAADw/wDx/////wAAACwAAAAACAAIAAACDZQvgaeb/lxbAIKA8y0AOw==) repeat 0 0
--  ]
-- debug-grid-16-solid : Style
-- debug-grid-16-solid =
--  Css.batch [
--  property "background" "#fff url(data" "image/gif"
-- base64,R0lGODdhEAAQAPEAAADw/wDx/xXy/////ywAAAAAEAAQAAACIZyPKckYDQFsb6ZqD85jZ2+BkwiRFKehhqQCQgDHcgwEBQA7) repeat 0 0
--  ]
