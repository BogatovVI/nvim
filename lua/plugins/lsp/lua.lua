local M = {}

function M.get_config(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        telemetry = { enabled = false },
      },
    },
  }
end

return M
