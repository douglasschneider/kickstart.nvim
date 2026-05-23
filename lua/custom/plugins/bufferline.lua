vim.pack.add({
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/akinsho/bufferline.nvim'
})

-- Configuração do plugin
require('bufferline').setup {
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
}

-- Keymaps
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Buffer Next' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Buffer Previous' })
vim.keymap.set('n', '<leader>bd', function()
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  local current_buf = vim.api.nvim_get_current_buf()

  -- Navega para o próximo buffer, se existir
  if #bufs > 1 then
    vim.cmd 'BufferLineCycleNext'
  end

  -- Deleta o buffer anterior
  vim.api.nvim_buf_delete(current_buf, { force = false })
end, { desc = '[B]uffer [D]elete' })
