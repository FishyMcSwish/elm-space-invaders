module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, attribute)
import Svg exposing (Svg, Attribute)
import Svg.Attributes as Attributes exposing (..)
import Time exposing (..)


type alias Model =
    { stuff : String }


type Msg
    = Tick Time
    | NoOp


initialModel : Model
initialModel =
    { stuff = "" }


init : ( Model, Cmd Msg )
init =
    ( { stuff = "" }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            Debug.log (toString time) ( { stuff = "" }, Cmd.none )

        NoOp ->
            ( { stuff = "" }, Cmd.none )


view : Model -> Html Msg
view model =
    div
        [ Html.Attributes.style
            [ ( "background-color", "#012" ), ( "width", "100%" ), ( "height", "100%" ) ]
        , attribute "display" "flex"
        , attribute "justify-content" "center"
        , attribute "align-items" "center"
        ]
        [ renderCanvas ]


subscriptions : Model -> Sub Msg
subscriptions model =
    every second Tick


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


renderCanvas : Html Msg
renderCanvas =
    Svg.svg [ Attributes.viewBox "0 0 900 900", width "100%" ]
        [ Svg.rect [ width "1400", height "900", fill "#efefef" ] []
        , Svg.circle [ cx "50", cy "50", r "45", fill "#0B79CE" ] []
        ]
