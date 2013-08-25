local html = require("lapis.html")
local csrf = require("lapis.csrf")
local Index
do
  local csrf_token
  local _parent_0 = html.Widget
  local _base_0 = {
    content = function(self)
      return html_5(function()
        return form({
          method = "POST",
          action = self:url_for("users_create")
        }, function()
          input({
            type = "hidden",
            name = "csrf_token",
            value = csrf_token
          })
          div(function()
            text("name:")
            return input({
              name = "name"
            })
          end)
          div(function()
            text("gender:")
            return input({
              name = "gender"
            })
          end)
          div(function()
            text("language:")
            return input({
              name = "language"
            })
          end)
          return input({
            type = "submit"
          })
        end)
      end)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Index",
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
  local self = _class_0
  csrf_token = csrf.generate_token(self)
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Index = _class_0
  return _class_0
end
