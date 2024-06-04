local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "solargraph",  -- Ruby
    "bashls",      -- Chef (Bash Language Server for shell scripts)
    "gopls",       -- Golang
    "terraformls", -- Terraform
    "jsonls",      -- JSON
    "yamlls"       -- YAML
  },
  handlers = {
    function(server_name)
      local opts = {}

      if server_name == "solargraph" then
        opts = {
          settings = {
            solargraph = {
              diagnostics = true,
            },
          },
        }
      elseif server_name == "terraformls" then
--      if server_name == "terraformls" then
        opts = {
          settings = {
            terraform = {
              lint = {
                enable = true,
              },
            },
          },
        }
      elseif server_name == "jsonls" then
        opts = {
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          },
        }
      elseif server_name == "yamlls" then
        opts = {
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
              },
              validate = true,
            },
          },
        }
      end

      require('lspconfig')[server_name].setup(opts)
    end,
  },
})

-- Setup Mason-Null-LS
require('mason-null-ls').setup({
  ensure_installed = {
    "shfmt",       -- Bash formatter
    "gofmt",       -- Golang formatter
    "rubocop",     -- Ruby formatter
    "terraform_fmt", -- Terraform formatter
    "prettier",    -- JSON, YAML formatter
  },
  handlers = {
    function(source_name, methods)
      require("mason-null-ls.automatic_setup")(source_name, methods)
    end,
  },
})

-- Setup Null-LS
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.shfmt,          -- Bash formatter
    null_ls.builtins.formatting.gofmt,          -- Golang formatter
    null_ls.builtins.formatting.rubocop,        -- Ruby formatter
    null_ls.builtins.formatting.terraform_fmt,  -- Terraform formatter
    null_ls.builtins.formatting.prettier,       -- JSON, YAML formatter
    -- Use rubocop with custom command
    null_ls.builtins.diagnostics.rubocop.with({
      command = "rubocop-airbnb", -- Specify the command if using rubocop-airbnb
    }),
    null_ls.builtins.formatting.rubocop.with({
      command = "rubocop-airbnb", -- Specify the command if using rubocop-airbnb
    }),
  },
})
