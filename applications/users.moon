-- applications/users.moon
import respond_to from require "lapis.application"
import capture_errors, yield_error from require "lapis.application"
import split, dump, get_options, unpack from require "moonscript.util"
csrf = require "lapis.csrf"
lapis = require "lapis"
db = require "lapis.db"

class UsersApplication extends lapis.Application

  [users_create: "/users_create"]: respond_to {
    GET: =>
      csrf_token = csrf.generate_token @
      render: true

    POST: =>
      -- redirect_to: @url_for "index"
      res = db.insert "users", {
        name: @params.name
        gender: tonumber(@params.gender)
        marry: tonumber(@params.marry)
        child: tonumber(@params.child)
        purpose: tonumber(@params.purpose)
        language: @params.language
        national: @params.national
        about_me: @params.about_me
        smoking: tonumber(@params.smoking)
        location: @params.location
        drinking: tonumber(@params.drinking)
        academic: tonumber(@params.academic)
        content: @params.content
        hobby: @params.hobby
        style: tonumber(@params.style)
      }, "id"
      -- resoult
      -- ed) [{"id":50}]
      json: res
  }

  -- gender:1/marry:1/child:2/purpose:2/language:[JA,EN]/national:JP/about_me:/smoking:1/location:TOKYO/drinking:1/academic:1/style:2
  -- don't add '/' in the end
  "/users/*": =>
    -- table
    result = {}
    args = @params.splat
    sep = '/'

    -- split by /
    result = {}
    items = split args, sep

    -- split key, value
    for i, path in ipairs items
      key, val = path\match "^(.*):(.*)$"
      result[key] = val

    query = "* from users where "
    gender = result["gender"] 
    if gender == nil
      query ..= "? = 1 "
      gender = 1
    else
      query ..= "gender = ? "

    marry = result["marry"]
    if marry == nil
      query ..= "and ? = 1 "
      marry = 1
    else
      marry ..= "and marry = ? "

    child = result["child"]
    if language == nil
      query ..= "and ? = 1 "
      child = 1
    else
      query ..= "and child = ? "

    language = result["language"]
    if language == nil
      query ..= "and ? = 1 "
      language = 1
    else
      query ..= "and language = ? "

    purpose = result["purpose"]
    if purpose == nil
      query ..= "and ? = 1 "
      purpose = 1
    else
      query ..= "and purpose = ? "

    res = db.select query,
      gender,
      marry,
      child,
      language,
      purpose

    json: res
