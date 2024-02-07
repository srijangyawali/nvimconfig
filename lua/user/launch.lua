LAZY_PLUGIN_SPEC = {}
-- this is a global table

function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
  -- this takes a variable item and insert it into that global table
  -- this funtion is also global
end
