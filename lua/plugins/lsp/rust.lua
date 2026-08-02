local M = {}

M.get_config = function(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
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
