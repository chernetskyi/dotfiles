vim.diagnostic.config({
  severity_sort = true,
  virtual_text = true,
})

vim.lsp.config('*', {
  single_file_support = true,
})

vim.lsp.enable({
  'basedpyright',
  'cssls',
  'dockerls',
  'gopls',
  'jsonls',
  'lua_ls',
  'ruff',
  'superhtml',
  'terraformls',
  'tflint',
  'yamlls',
})

vim.api.nvim_create_user_command('TruncateLspLogFile', function()
  local filename = vim.lsp.log.get_filename()
  -- https://github.com/neovim/neovim/blob/v0.11.1/runtime/lua/vim/lsp/health.lua
  local keep_bytes = 90 * 1000 * 1000

  vim.uv.fs_open(filename, 'r+', tonumber('644', 8), function(err, fd)
    if err then
      print('Error opening the file:', err)
      return
    end

    vim.uv.fs_fstat(fd, function(err, stat)
      if err then
        print('Error getting the file stats:', err)
        vim.uv.fs_close(fd)
        return
      end

      local file_size = stat and stat.size or 0
      if keep_bytes >= file_size then
        print('The file is small. No truncation is done.')
        vim.uv.fs_close(fd)
        return
      end

      local offset = file_size - keep_bytes
      vim.uv.fs_read(fd, keep_bytes, offset, function(err, data)
        if err then
          print('Error reading the file:', err)
          vim.uv.fs_close(fd)
          return
        end

        vim.uv.fs_ftruncate(fd, 0, function(err)
          if err then
            print('Error truncating the file:', err)
            vim.uv.fs_close(fd)
            return
          end
        end)

        vim.uv.fs_write(fd, data, 0, function(err, _)
          if err then
            print('Error writing the file:', err)
          else
            print(
              string.format('Truncated the file to the last %.2f MiB', keep_bytes / (1024 * 1024))
            )
          end
          vim.uv.fs_close(fd)
        end)
      end)
    end)
  end)
end, {})
