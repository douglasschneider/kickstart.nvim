return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        -- Mostra indicadores de diagnóstico LSP nas abas
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        -- Separador de abas (outras opções: "slant", "padded_slant", "thick", "thin")
        separator_style = 'slant',
        -- Sempre exibe a bufferline mesmo com um único buffer
        always_show_bufferline = true,
      },
    },
  },
}
