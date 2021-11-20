local surround = require 'surround'

surround.setup {
  -- number of lines to look for above and below
  -- the current line while searching for nestable pairs
  context_offset = 100,

  load_autogroups = false,

  mappings_style = "sandwich",

  map_insert_mode = true,

  quotes = {"'", '"'},

  brackets = {"(", '{', '['},

  pairs = {
    nestable = {{"(", ")"}, {"[", "]"}, {"{", "}"}},
    linear = {{"'", "'"}, {"`", "`"}, {'"', '"'}}
  },

  prefix = "s"
}
