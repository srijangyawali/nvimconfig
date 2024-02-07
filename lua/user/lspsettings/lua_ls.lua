-- https://luals.github.io/wiki/settings/
return {
  settings = {
    Lua = {
      format = {
        enable = false,
        -- handle formatting with lua server
      },
      diagnostics = {
        globals = { "vim", "spec" },
        -- defining the global variables
      },
      runtime = {
        version = "LuaJIT",
        -- this makes spec work like require
        special = {
          spec = "require",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      hint = {
        enable = false,
        arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
        await = true,
        paramName = "Disable", -- "All" | "Literal" | "Disable"
        paramType = true,
        semicolon = "All", -- "All" | "SameLine" | "Disable"
        setType = false,
      },
      -- telemetry is the process of recording user patterns
      -- this is removed
      telemetry = {
        enable = false,
      },
    },
  },
}
