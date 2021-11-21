-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/chernetskyi/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/chernetskyi/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/chernetskyi/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/chernetskyi/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/chernetskyi/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2‰\2\0\0\4\0\18\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\a\0003\3\6\0:\3\b\2:\2\t\0013\2\v\0003\3\n\0:\3\f\0023\3\r\0:\3\14\2:\2\15\0013\2\16\0:\2\17\1>\0\2\1G\0\1\0\15extensions\1\3\0\0\rfugitive\14nvim-tree\ftabline\14lualine_z\1\2\0\0\ttabs\14lualine_a\1\0\0\1\2\0\0\fbuffers\rsections\14lualine_x\1\0\0\1\2\0\0\rfiletype\foptions\1\0\0\1\0\1\ntheme\15tokyonight\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\1\2n\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\18builtin_marks\1\5\0\0\6.\6\"\0060\6'\1\0\1\21default_mappings\1\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentau/marks.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2;\0\1\3\0\4\0\0064\1\0\0007\1\1\0017\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\20vsnip#anonymous\afn\bvimå\a\1\0\n\0004\0r4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\1\6\0003\2\n\0003\3\b\0001\4\a\0:\4\t\3:\3\v\0023\3\14\0007\4\f\0007\4\r\4'\5üÿ>\4\2\2:\4\15\0037\4\f\0007\4\r\4'\5\4\0>\4\2\2:\4\16\0037\4\f\0007\4\17\4>\4\1\2:\4\18\0037\4\f\0007\4\19\4>\4\1\2:\4\20\0037\4\f\0007\4\21\4>\4\1\2:\4\22\0037\4\f\0007\4\23\4>\4\1\2:\4\24\3:\3\f\0027\3\25\0007\3\26\0032\4\3\0003\5\27\0;\5\1\0043\5\28\0;\5\2\0042\5\3\0003\6\29\0;\6\1\5>\3\3\2:\3\26\2>\1\2\0017\1\6\0007\1\30\1%\2\31\0003\3!\0002\4\3\0003\5 \0;\5\1\4:\4\26\3>\1\3\0017\1\6\0007\1\30\1%\2\"\0003\3%\0007\4\25\0007\4\26\0042\5\3\0003\6#\0;\6\1\0052\6\3\0003\a$\0;\a\1\6>\4\3\2:\4\26\3>\1\3\0014\1\4\0%\2&\0>\1\2\0027\1'\0014\2\0\0007\2(\0027\2)\0027\2*\2>\2\1\0=\1\0\0023\2+\0004\3,\0\16\4\2\0>\3\2\4T\6\b€4\b\4\0%\t-\0>\b\2\0026\b\a\b7\b\6\b3\t.\0:\1/\t>\b\2\1A\6\3\3N\6ö4\3\4\0%\4-\0>\3\2\0027\0030\0037\3\6\0033\0041\0:\1/\0043\0052\0:\0053\4>\3\2\1G\0\1\0\bcmd\1\2\0\0*/usr/lib/elixir-ls/language_server.sh\1\0\0\relixirls\17capabilities\1\0\0\14lspconfig\vipairs\1\a\0\0\vbashls\rdockerls\19fsautocomplete\vjsonls\16terraformls\vyamlls\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\n<Tab>\21select_next_item\t<CR>\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2Ó\1\0\0\5\0\r\0\0194\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0003\1\6\0>\0\2\0014\0\0\0007\0\a\0007\0\b\0%\1\t\0%\2\n\0%\3\v\0003\4\f\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\24:NvimTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\27nvim_tree_add_trailing\6g\bvim\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2i\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    config = { "\27LJ\1\2Ù\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0¹\1            augroup recompile-packer-on-save\n              autocmd!\n              autocmd BufWritePost plugins.lua source <afile> | PackerCompile\n            augroup end\n          \bcmd\bvim\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pears.nvim"] = {
    config = { "\27LJ\1\2R\0\1\3\0\2\0\a7\1\0\0)\2\1\0>\1\2\0017\1\1\0)\2\2\0>\1\2\1G\0\1\0\20expand_on_enter#remove_pair_on_outer_backspace8\1\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0001\1\3\0>\0\2\1G\0\1\0\0\nsetup\npears\frequire\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/pears.nvim",
    url = "https://github.com/steelsojka/pears.nvim"
  },
  ["registers.nvim"] = {
    config = { "\27LJ\1\2ñ\1\0\0\2\0\n\0\0214\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\0\0:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\a\0004\0\0\0007\0\1\0%\1\t\0:\1\b\0G\0\1\0\vsingle\28registers_window_border#registers_hide_only_whitespace#registers_show_empty_registers\aÂ·\27registers_space_symbol\b-->\25registers_tab_symbol\6g\bvim\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\1\2™\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\0\1\0\1\31enable_default_keybindings\2\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\1\2Œ\1\0\0\3\0\t\0\r4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0003\1\a\0003\2\6\0:\2\b\1>\0\2\1G\0\1\0\fmatchup\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\19loaded_matchit\6g\bvim\0" },
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimtex = {
    loaded = true,
    path = "/home/chernetskyi/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2i\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2;\0\1\3\0\4\0\0064\1\0\0007\1\1\0017\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\20vsnip#anonymous\afn\bvimå\a\1\0\n\0004\0r4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\1\6\0003\2\n\0003\3\b\0001\4\a\0:\4\t\3:\3\v\0023\3\14\0007\4\f\0007\4\r\4'\5üÿ>\4\2\2:\4\15\0037\4\f\0007\4\r\4'\5\4\0>\4\2\2:\4\16\0037\4\f\0007\4\17\4>\4\1\2:\4\18\0037\4\f\0007\4\19\4>\4\1\2:\4\20\0037\4\f\0007\4\21\4>\4\1\2:\4\22\0037\4\f\0007\4\23\4>\4\1\2:\4\24\3:\3\f\0027\3\25\0007\3\26\0032\4\3\0003\5\27\0;\5\1\0043\5\28\0;\5\2\0042\5\3\0003\6\29\0;\6\1\5>\3\3\2:\3\26\2>\1\2\0017\1\6\0007\1\30\1%\2\31\0003\3!\0002\4\3\0003\5 \0;\5\1\4:\4\26\3>\1\3\0017\1\6\0007\1\30\1%\2\"\0003\3%\0007\4\25\0007\4\26\0042\5\3\0003\6#\0;\6\1\0052\6\3\0003\a$\0;\a\1\6>\4\3\2:\4\26\3>\1\3\0014\1\4\0%\2&\0>\1\2\0027\1'\0014\2\0\0007\2(\0027\2)\0027\2*\2>\2\1\0=\1\0\0023\2+\0004\3,\0\16\4\2\0>\3\2\4T\6\b€4\b\4\0%\t-\0>\b\2\0026\b\a\b7\b\6\b3\t.\0:\1/\t>\b\2\1A\6\3\3N\6ö4\3\4\0%\4-\0>\3\2\0027\0030\0037\3\6\0033\0041\0:\1/\0043\0052\0:\0053\4>\3\2\1G\0\1\0\bcmd\1\2\0\0*/usr/lib/elixir-ls/language_server.sh\1\0\0\relixirls\17capabilities\1\0\0\14lspconfig\vipairs\1\a\0\0\vbashls\rdockerls\19fsautocomplete\vjsonls\16terraformls\vyamlls\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\n<Tab>\21select_next_item\t<CR>\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2Ó\1\0\0\5\0\r\0\0194\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0003\1\6\0>\0\2\0014\0\0\0007\0\a\0007\0\b\0%\1\t\0%\2\n\0%\3\v\0003\4\f\0>\0\5\1G\0\1\0\1\0\1\fnoremap\2\24:NvimTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\27nvim_tree_add_trailing\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\1\2n\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\18builtin_marks\1\5\0\0\6.\6\"\0060\6'\1\0\1\21default_mappings\1\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: registers.nvim
time([[Config for registers.nvim]], true)
try_loadstring("\27LJ\1\2ñ\1\0\0\2\0\n\0\0214\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\0\0:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\a\0004\0\0\0007\0\1\0%\1\t\0:\1\b\0G\0\1\0\vsingle\28registers_window_border#registers_hide_only_whitespace#registers_show_empty_registers\aÂ·\27registers_space_symbol\b-->\25registers_tab_symbol\6g\bvim\0", "config", "registers.nvim")
time([[Config for registers.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\1\2™\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\0\1\0\1\31enable_default_keybindings\2\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: pears.nvim
time([[Config for pears.nvim]], true)
try_loadstring("\27LJ\1\2R\0\1\3\0\2\0\a7\1\0\0)\2\1\0>\1\2\0017\1\1\0)\2\2\0>\1\2\1G\0\1\0\20expand_on_enter#remove_pair_on_outer_backspace8\1\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0001\1\3\0>\0\2\1G\0\1\0\0\nsetup\npears\frequire\0", "config", "pears.nvim")
time([[Config for pears.nvim]], false)
-- Config for: packer.nvim
time([[Config for packer.nvim]], true)
try_loadstring("\27LJ\1\2Ù\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0¹\1            augroup recompile-packer-on-save\n              autocmd!\n              autocmd BufWritePost plugins.lua source <afile> | PackerCompile\n            augroup end\n          \bcmd\bvim\0", "config", "packer.nvim")
time([[Config for packer.nvim]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\1\2Œ\1\0\0\3\0\t\0\r4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0003\1\a\0003\2\6\0:\2\b\1>\0\2\1G\0\1\0\fmatchup\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\19loaded_matchit\6g\bvim\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2‰\2\0\0\4\0\18\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\a\0003\3\6\0:\3\b\2:\2\t\0013\2\v\0003\3\n\0:\3\f\0023\3\r\0:\3\14\2:\2\15\0013\2\16\0:\2\17\1>\0\2\1G\0\1\0\15extensions\1\3\0\0\rfugitive\14nvim-tree\ftabline\14lualine_z\1\2\0\0\ttabs\14lualine_a\1\0\0\1\2\0\0\fbuffers\rsections\14lualine_x\1\0\0\1\2\0\0\rfiletype\foptions\1\0\0\1\0\1\ntheme\15tokyonight\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
