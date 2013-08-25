local create_table, types
do
  local _obj_0 = require("lapis.db.schema")
  create_table, types = _obj_0.create_table, _obj_0.types
end
return {
  [1] = function(self)
    return create_table("users", {
      {
        "id",
        types.serial
      },
      {
        "user_id",
        types.integer
      },
      {
        "name",
        types.text
      },
      {
        "gender",
        types.integer
      },
      {
        "marry",
        types.integer
      },
      {
        "child",
        types.integer
      },
      {
        "purpose",
        types.integer({
          default = 0
        })
      },
      {
        "language",
        types.text({
          null = true
        })
      },
      {
        "national",
        types.text({
          null = true
        })
      },
      {
        "about_me",
        types.text({
          null = true
        })
      },
      {
        "smoking",
        types.text({
          null = true
        })
      },
      {
        "location",
        types.text({
          null = true
        })
      },
      {
        "drinking",
        types.integer({
          null = true
        })
      },
      {
        "academic",
        types.integer({
          null = true
        })
      },
      {
        "content",
        types.text({
          null = true
        })
      },
      {
        "hobby",
        types.text({
          null = true
        })
      },
      {
        "style",
        types.integer({
          null = true
        })
      },
      "PRIMARY KEY (id)"
    })
  end,
  [2] = function(self)
    return create_table("messages", {
      {
        "id",
        types.serial
      },
      {
        "user_id1",
        types.integer
      },
      {
        "user_id2",
        types.integer
      },
      {
        "content",
        types.text
      },
      "PRIMARY KEY (id)"
    })
  end,
  [3] = function(self)
    return create_table("mst_hobbies", {
      {
        "id",
        types.serial
      },
      {
        "type",
        types.integer
      },
      {
        "name",
        types.text
      },
      "PRIMARY KEY (id)"
    })
  end,
  [4] = function(self)
    return create_table("user_styles", {
      {
        "id",
        types.serial
      },
      {
        "user_id",
        types.serial
      },
      {
        "length",
        types.serial
      },
      {
        "weight",
        types.serial
      },
      {
        "figure",
        types.serial
      },
      "PRIMARY KEY (id)"
    })
  end,
  [5] = function(self)
    return create_table("user_images", {
      {
        "id",
        types.serial
      },
      {
        "user_id",
        types.integer
      },
      {
        "image",
        types.text
      },
      "PRIMARY KEY (id)"
    })
  end
}
