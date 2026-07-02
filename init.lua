-- NixCats -> nix-wrapper-modules Compatibility Shim
local has_nix_info, nix_info = pcall(require, "nix-info")

-- Simulates the global nixCats() function using the nix-info table
_G.nixCats = function(key)
  if has_nix_info then
    -- Tries to get from info (e.g.: 'have_nerd_font')
    return nix_info.info[key]
  else
    -- Fallback/Default when Neovim runs without Nix (Mason mode)
    if key == "have_nerd_font" then return false end
    return nil
  end
end

-- Simulates the nixCatsUtils module
package.preload["nixCatsUtils"] = function()
  return {
    isNixCats = has_nix_info,
    enableForCategory = function(v, default)
      if has_nix_info then
        return nixCats(v) and true or false
      else
        return default
      end
    end,
    getCatOrDefault = function(v, default)
      if has_nix_info then
        return nixCats(v)
      else
        return default
      end
    end,
    lazyAdd = function(v, o)
      if has_nix_info then
        return o
      else
        return v
      end
    end,
    setup = function(v)
      -- Do nothing as the global nixCats is already shimmed
    end
  }
end

-- Initializes the mock or real nixCats
local nixCatsUtils = require("nixCatsUtils")
nixCatsUtils.setup({
	non_nix_value = true,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = nixCats("have_nerd_font")

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme (compile cache if missing)
local base46_ok, base46 = pcall(require, "base46")
if base46_ok then
	base46.load_all_highlights()
end
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("autocmds")

vim.schedule(function()
	require("mappings")
end)
