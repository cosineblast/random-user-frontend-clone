
module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Browser

import Heroicons.Outline as Icons

main =
    div []
    [ header [class "flex justify-center pt-10 bg-zinc-800 text-white pb-10"]
        [ div [class "flex flex-col items-center text-center"]
            [ p [class "text-5xl mb-5"] [text "RANDOM USER GENERATOR"]
            , p [class "mb-2"] [ text "A free, open-source API for generating random user data. Like Lorem Ipsum, but for people." ]
            , p [class "text-zinc-400"] [ text "Follow us @randomapi"]
            ]

        ]
    , main_ [class "max-w-screen-md mx-auto pt-20"]
        [
            section [class "rounded-lg shadow-lg p-2 relative mx-5"]
            [ figure [class "absolute left-0 right-0 top-10 flex justify-center"]
                [ div [class "border-solid border-2 border-zinc-300 rounded-full p-1 bg-white"]
                    [ img [class "rounded-full w-40 h-40", src "https://i.redd.it/ljfpcj6bdih41.jpg"] []
                    ]
                ]
            , div [class "pt-20 pb-10"] []
            , hr [] []
            , div [class "pt-28 flex flex-col items-center gap-2 pb-5"]
                [ p [class "text-zinc-500"] [ text "My name is" ]
                , p [class "text-5xl"] [ text "God" ]
                , div [class "flex flex-row gap-10 flex-wrap justify-center"]
                    [ p [class "w-10"] [Icons.user []]
                    , p [class "w-10"] [Icons.envelope []]
                    , p [class "w-10"] [Icons.cake []]
                    , p [class "w-10"] [Icons.mapPin []]
                    , p [class "w-10"] [Icons.phone []]
                    , p [class "w-10"] [Icons.lockClosed []]
                    ]
                ]
            ]
        ]
    ]
