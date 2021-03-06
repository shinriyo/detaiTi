local lapis = require("lapis")
local console = require("lapis.console")
local db = require("lapis.db")
local Users, Tags
do
  local _obj_0 = require("models")
  Users, Tags = _obj_0.Users, _obj_0.Tags
end
return lapis.serve((function()
  do
    local _parent_0 = lapis.Application
    local _base_0 = {
      ["/list"] = function(self)
        return "ok!"
      end,
      ["/things/*"] = function(self)
        return self:url_for("users_list", {
          splat = self.params.splat
        })
      end,
      ["/console"] = console.make()
    }
    _base_0.__index = _base_0
    setmetatable(_base_0, _parent_0.__base)
    local _class_0 = setmetatable({
      __init = function(self, ...)
        return _parent_0.__init(self, ...)
      end,
      __base = _base_0,
      __name = nil,
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
    self:include(require("applications.users", {
      path = "/users",
      name = "user_"
    }))
    if _parent_0.__inherited then
      _parent_0.__inherited(_parent_0, _class_0)
    end
    return _class_0
  end
end)())
