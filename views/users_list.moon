import Widget from require "lapis.html"

class Index extends Widget
  content: =>
    h1 class: "header", @id
    div class: "body", ->
      text "user list"
