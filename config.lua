local config
do
  local _obj_0 = require("lapis.config")
  config = _obj_0.config
end
config("development", function()
  postgresql_url("postgres://postgres:lapis@127.0.0.1/deaiti")
  return port(8080)
end)
return config("production", function()
  port(80)
  num_workers(4)
  return lua_code_cache("off")
end)
