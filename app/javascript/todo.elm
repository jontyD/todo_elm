module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


--init


init : ( Model, Cmd Msg )
init =
    ( { todo = ""
      , todos = []
      }
    , Cmd.none
    )



--model


type alias Model =
    { todo : String
    , todos : List String
    }


model : Model
model =
    { todo = ""
    , todos = []
    }



--update


type Msg
    = UpdateTodo String
    | AddTodo
    | RemoveAll
    | RemoveItem String
    | None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateTodo text ->
            { model | todo = text } ! []

        AddTodo ->
            { model | todos = model.todo :: model.todos } ! []

        RemoveAll ->
            { model | todos = [] } ! []

        RemoveItem text ->
            { model | todos = List.filter (\x -> x /= text) model.todos } ! []

        None ->
            { model | todos = [] } ! []



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



--view


todoItem : String -> Html Msg
todoItem todo =
    li [] [ text todo, button [ onClick RemoveItem todo ] [ text "X" ] ] ! []


todoList : List String -> Html Msg
todoList todos =
    let
        child =
            List.map todoItem todos
    in
    ul [] child


view : Model -> Html Msg
view model =
    div []
        [ input
            [ type_ "text"
            , onInput UpdateTodo
            , value model.todo
            ]
            []
        , button [ onClick AddTodo ] [ text "Submit" ]
        , button [ onClick RemoveAll ] [ text "Remove All" ]
        , div [] [ todoList model.todos ]
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
