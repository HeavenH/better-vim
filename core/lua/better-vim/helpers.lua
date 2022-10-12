local config = require("better-vim")
local default_config = require("better-vim.default-config")

local function get_config_item(keys)
  local value = config
  local defaultValue = default_config

  for i, key in ipairs(keys) do
    if value[key] ~= nil then
      value = value[key]
    else 
      value = defaultValue[key]
    end

    defaultValue = defaultValue[key]
  end

  return value
end

local function with_leader_as_prefix(key)
  local leader = get_config_item {"mappings", "leader"}
  local label = leader == " " and "<SPACE>" or leader

  return label .. key
end

return {
  with_leader_as_prefix = with_leader_as_prefix,
  get_config_item = get_config_item
}
