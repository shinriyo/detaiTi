db = require "lapis.db"

import Model from require "lapis.db.model"

class Users extends Model

class Tags extends Model
  @primary_key: {"user_id", "tag"}
