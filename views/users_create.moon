--import Widget from require "lapis.html"
html = require "lapis.html"
csrf = require "lapis.csrf"

--class Index extends Widget
class Index extends html.Widget
  csrf_token = csrf.generate_token @
  content: =>
    html_5 ->
      form method: "POST", action: @url_for("users_create"), ->
        input type: "hidden", name: "csrf_token", value: csrf_token
        div ->
          text "name:"
          input name: "name"
        div ->
          text "gender:"
          input name: "gender"
        div ->
          text "language:"
          input name: "language"
        input type: "submit"
