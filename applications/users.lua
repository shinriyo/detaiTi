local respond_to
do
  local _obj_0 = require("lapis.application")
  respond_to = _obj_0.respond_to
end
local capture_errors, yield_error
do
  local _obj_0 = require("lapis.application")
  capture_errors, yield_error = _obj_0.capture_errors, _obj_0.yield_error
end
local split, dump, get_options, unpack
do
  local _obj_0 = require("moonscript.util")
  split, dump, get_options, unpack = _obj_0.split, _obj_0.dump, _obj_0.get_options, _obj_0.unpack
end
local csrf = require("lapis.csrf")
local lapis = require("lapis")
local db = require("lapis.db")
local UsersApplication
do
  local _parent_0 = lapis.Application
  local _base_0 = {
    [{
      users_create = "/users_create"
    }] = respond_to({
      GET = function(self)
        local csrf_token = csrf.generate_token(self)
        return {
          render = true
        }
      end,
      POST = function(self)
        local user_id = self.params.id
        local res = ""
        local update_params = {
          name = self.params.name,
          gender = tonumber(self.params.gender),
          marry = tonumber(self.params.marry),
          child = tonumber(self.params.child),
          purpose = tonumber(self.params.purpose),
          language = self.params.language,
          national = self.params.national,
          about_me = self.params.about_me,
          smoking = tonumber(self.params.smoking),
          location = self.params.location,
          drinking = tonumber(self.params.drinking),
          academic = tonumber(self.params.academic),
          content = self.params.content,
          hobby = self.params.hobby,
          style = tonumber(self.params.style)
        }
        if user_id == nil then
          res = db.insert("users", update_params, "id")
          return {
            json = res
          }
        else
          return db.update("users", update_params, {
            id = user_id
          })
        end
      end
    }),
    ["/users/*"] = function(self)
      local result = { }
      local args = self.params.splat
      local sep = '/'
      result = { }
      local items = split(args, sep)
      for i, path in ipairs(items) do
        local key, val = path:match("^(.*):(.*)$")
        result[key] = val
      end
      local query = "* from users where "
      local gender = result["gender"]
      if gender == nil then
        query = query .. "? = 1 "
        gender = 1
      else
        query = query .. "gender = ? "
      end
      local marry = result["marry"]
      if marry == nil then
        query = query .. "and ? = 1 "
        marry = 1
      else
        marry = marry .. "and marry = ? "
      end
      local child = result["child"]
      if language == nil then
        query = query .. "and ? = 1 "
        child = 1
      else
        query = query .. "and child = ? "
      end
      local language = result["language"]
      if language == nil then
        query = query .. "and ? = 1 "
        language = 1
      else
        query = query .. "and language = ? "
      end
      local purpose = result["purpose"]
      if purpose == nil then
        query = query .. "and ? = 1 "
        purpose = 1
      else
        query = query .. "and purpose = ? "
      end
      local res = db.select(query, gender, marry, child, language, purpose)
      return {
        json = res
      }
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "UsersApplication",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  UsersApplication = _class_0
  return _class_0
end
