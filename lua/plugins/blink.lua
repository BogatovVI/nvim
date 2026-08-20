return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    completion = {
      accept = { auto_brackets = { enabled = true } },
    },
    opts = {
      keymap = {
        preset = 'none', 
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<CR>'] = { 'accept', 'fallback' }, -- Enter подтверждает выбор
        ['<Tab>'] = { 'select_next', 'fallback' }, -- Tab идет вниз
        ['<S-Tab>'] = { 'select_prev', 'fallback' }, -- Shift+Tab идет вверх
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { "sources.default" }
  }
}
