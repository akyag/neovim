local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"



-- 
-- lspconfig.pyright.setup { blabla}
--
-- lspconfig.unocss.setup {
--  			filetypes = { "astro", "html" },
--  			root_dir = function(fname)
-- 	 			return require 'lspconfig.util'.root_pattern("uno.config.js", "uno.config.ts")(fname)
-- 			end
-- 		}

local util = require "lspconfig.util"
local configs = require "lspconfig.configs"

configs["unocss"] = {
  default_config = {
    cmd = { "unocss-language-server", "--stdio" },
    filetypes = {
      "html",
      "astro",
      "javascriptreact",
      "typescriptreact",
    },

    on_new_config = function(new_config)
      if not new_config.settings then
        new_config.settings = {}
      end
      if not new_config.settings.editor then
        new_config.settings.editor = {}
      end
      if not new_config.settings.editor.tabSize then
        -- set tab size for hover
        new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
      end
    end,

    -- on_new_config = function(new_config) end,
    root_dir = function(fname)
      return util.root_pattern("uno.config.js", "uno.config.ts")(fname)
        or util.find_package_json_ancestor(fname)
        or util.find_node_modules_ancestor(fname)
        or util.find_git_ancestor(fname)
    end,
  },
}

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "jsonls", "tsserver", "bashls", "unocss", "astro" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
