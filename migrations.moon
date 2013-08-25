-- migrations.moon

import create_table, types from require "lapis.db.schema"
{
  [1]: =>
    create_table "users", {
      { "id", types.serial }
      { "user_id", types.integer }
      { "name", types.text }
      { "gender", types.integer }
      { "marry", types.integer }
      { "child", types.integer }
      { "purpose", types.integer default: 0 }
      { "language", types.text null: true }
      { "national", types.text null: true }
      { "about_me", types.text null: true }
      { "smoking", types.integer default: 0 }
      { "location", types.text null: true }
      { "drinking", types.integer null: true }
      { "academic", types.integer null: true }
      { "content", types.text null: true }
      { "hobby", types.text null: true }
      { "style", types.integer null: true  }
      "PRIMARY KEY (id)"
    }
  [2]: =>
    create_table "messages", {
      { "id", types.serial }
      { "user_id1", types.integer }
      { "user_id2", types.integer }
      { "content", types.text }
      "PRIMARY KEY (id)"
    }
  [3]: =>
    create_table "mst_hobbies", {
      { "id", types.serial }
      { "type", types.integer }
      { "name", types.text }
      "PRIMARY KEY (id)"
    }
  [4]: =>
    create_table "user_styles", {
      { "id", types.serial }
      { "user_id", types.serial }
      { "length", types.serial }
      { "weight", types.serial }
      { "figure", types.serial }
      "PRIMARY KEY (id)"
    }
  [5]: =>
    create_table "user_images", {
      { "id", types.serial }
      { "user_id", types.integer }
      { "image", types.text }
      "PRIMARY KEY (id)"
    }
}

