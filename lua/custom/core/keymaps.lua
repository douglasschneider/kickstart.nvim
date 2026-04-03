-- Bufferline
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Buffer Next' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Buffer Previous' })
vim.keymap.set('n', '<leader>bd', function()
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  local current_buf = vim.api.nvim_get_current_buf()

  -- Navega para o próximo buffer, se existir
  if #bufs > 1 then vim.cmd 'BufferLineCycleNext' end

  -- Deleta o buffer anterior
  vim.api.nvim_buf_delete(current_buf, { force = false })
end, { desc = '[B]uffer [D]elete' })
