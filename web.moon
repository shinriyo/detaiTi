lapis = require "lapis"
console = require "lapis.console"
db = require "lapis.db"

import Users, Tags from require "models"

lapis.serve class extends lapis.Application
  @include require "applications.users", path: "/users", name: "user_"

  "/list": =>
    -- user = Users\find 2
    -- user
    --res = db.query "SELECT * FROM users"
    "ok!"

  --"/things/*": => "Rest of the url: #{@params.splat}"
  "/things/*": =>
    @url_for "users_list", splat: @params.splat

  "/console": console.make!
