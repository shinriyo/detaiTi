import config from require "lapis.config"

config "development", ->
  postgresql_url "postgres://postgres:lapis@127.0.0.1/deaiti"
  port 8080

config "production", ->
  port 80
  num_workers 4
  lua_code_cache "off"
