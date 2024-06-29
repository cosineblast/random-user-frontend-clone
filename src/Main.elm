
module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Browser
import Maybe as M

import Heroicons.Outline as Icons

main = Browser.sandbox { init = init, update = update, view = view }


type alias User =
    { name : String
    , email: String
    , birthdate : String
    , address : String
    , phoneNumber : String
    , imageUrl : String
    }

type SelectedOption =
    Name
    | Email
    | Birthdate
    | Address
    | Phone

type alias Model =
    { user : Maybe User
    , selectedOption : SelectedOption
    }

god = { name = "God"
        , email = "god@god.com"
        , birthdate = "09/12/2036"
        , address = "your bones"
        , phoneNumber = "424242424242"
        , imageUrl = "https://i.redd.it/ljfpcj6bdih41.jpg"
        }

init : Model
init =
    { user = Just god
    , selectedOption = Name
    }

type Msg = SwitchSelectedOption SelectedOption

update : Msg -> Model -> Model
update msg model =
    case msg of
        SwitchSelectedOption option ->
            { model | selectedOption = option }

selectedOptionName : SelectedOption -> String
selectedOptionName option =
    case option of
        Name -> "name"
        Email -> "email"
        Birthdate -> "birth date"
        Address -> "address"
        Phone -> "phone"

getSelectedOption : SelectedOption -> User -> String
getSelectedOption option user =
    case option of
        Name -> user.name
        Email -> user.email
        Birthdate -> user.birthdate
        Address -> user.address
        Phone -> user.phoneNumber

mapDefault : Maybe a -> (a -> b) -> b -> b
mapDefault thing f def = thing |> Maybe.map f |> Maybe.withDefault def

viewUserCard : Model -> Html Msg
viewUserCard model =
    section [class "rounded-lg shadow-lg p-2 relative mx-5"]
        [ figure [class "absolute left-0 right-0 top-10 flex justify-center"]
            [ div [class "border-solid border-2 border-zinc-300 rounded-full p-1 bg-white"]
                [ img [class "rounded-full w-40 h-40", src (mapDefault model.user (\it -> it.imageUrl) "")] []
                ]
            ]
        , div [class "pt-20 pb-10"] []
        , hr [] []
        , div [class "pt-28 flex flex-col items-center gap-2 pb-5"]
            [ p [class "text-zinc-500"] [ text ("Hi, my " ++ selectedOptionName model.selectedOption ++ " is") ]
            , p [class "text-5xl"] [ text (model.user |> M.map (getSelectedOption model.selectedOption) |> M.withDefault "...") ]
            , div [class "flex flex-row gap-10 flex-wrap justify-center mt-3"]
                [ p [class "w-10", onMouseEnter (SwitchSelectedOption Name)] [Icons.user []]
                , p [class "w-10", onMouseEnter (SwitchSelectedOption Email)] [Icons.envelope []]
                , p [class "w-10", onMouseEnter (SwitchSelectedOption Birthdate)] [Icons.cake []]
                , p [class "w-10", onMouseEnter (SwitchSelectedOption Address)] [Icons.mapPin []]
                , p [class "w-10", onMouseEnter (SwitchSelectedOption Phone)] [Icons.phone []]
                ]
            ]
        ]

view : Model -> Html Msg
view model =
    div []
    [ header [class "flex justify-center pt-10 bg-zinc-800 text-white pb-10"]
        [ div [class "flex flex-col items-center text-center"]
            [ p [class "text-5xl mb-5"] [text "RANDOM USER GENERATOR"]
            , p [class "mb-2"]
                [ text "A free, open-source API for generating random user data. Like Lorem Ipsum, but for people." ]
            , p [class "text-zinc-400"] [ text "Follow us @randomapi"]
            ]
        ]

    , main_ [class "max-w-screen-md mx-auto pt-20"]
        [
            viewUserCard model
        ]
    ]
