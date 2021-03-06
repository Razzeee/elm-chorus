module Components.LeftSidebar exposing (view)

import Colors
import Element exposing (..)
import Element.Background as Background
import Html.Attributes
import Material.Icons as Filled
import Material.Icons.Types as MITypes exposing (Coloring(..), Icon)
import Spa.Generated.Route as Route exposing (Route)


view : Element msg
view =
    column [ height fill, centerX, spacing 20, padding 15, alignLeft, htmlAttribute <| Html.Attributes.style "pointer-events" "all" ]
        [ musicButton
        , movieButton
        , tvshowButton
        , browserButton
        , addonsButton
        , thumbsupButton
        , playlistButton
        , settingsButton
        , helpButton
        ]


materialIconLink : ( Icon msg, Route ) -> Element msg
materialIconLink ( icon, route ) =
    el
        [ Element.mouseOver
            [ scale 1.1
            , Background.color Colors.brandPrimary
            ]
        ]
    <|
        Element.link []
            { url = Route.toString route
            , label = Element.html (icon 20 (MITypes.Color <| (Colors.fromElementColorToColor <| Colors.greyscaleOuterSpace)))
            }



-- buttons


musicButton : Element msg
musicButton =
    materialIconLink ( Filled.library_music, Route.Music )


movieButton : Element msg
movieButton =
    materialIconLink ( Filled.movie, Route.Movies__Recent )


tvshowButton : Element msg
tvshowButton =
    materialIconLink ( Filled.tv, Route.Tvshows__Recent )


browserButton : Element msg
browserButton =
    materialIconLink ( Filled.list, Route.Browser )


addonsButton : Element msg
addonsButton =
    materialIconLink ( Filled.extension, Route.Addons )


thumbsupButton : Element msg
thumbsupButton =
    materialIconLink ( Filled.thumb_up, Route.Thumbsup )


playlistButton : Element msg
playlistButton =
    materialIconLink ( Filled.assignment, Route.Playlists )


settingsButton : Element msg
settingsButton =
    materialIconLink ( Filled.settings, Route.Settings__Web )


helpButton : Element msg
helpButton =
    materialIconLink ( Filled.help, Route.Help )
