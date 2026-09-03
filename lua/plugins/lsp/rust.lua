local M = {}

function M.get_config(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        },
        inlayHints = {
          bindingModeHints = { enable = true },
          chainingHints = { enable = true },
          closingBraceHints = { enable = true },
          parameterHints = { enable = true },
          typeHints = { enable = true },
        },
      },
    },
  }
end

return M
