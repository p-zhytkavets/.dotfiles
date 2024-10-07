return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.completion = {
        completeopt = "menu,menuone,noinsert",
        autocomplete = false,
      }
    end,
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     local cmp = require("cmp")
  --
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
  --           cmp.select_next_item()
  --         elseif vim.snippet.active({ direction = 1 }) then
  --           vim.schedule(function()
  --             vim.snippet.jump(1)
  --           end)
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         elseif vim.snippet.active({ direction = -1 }) then
  --           vim.schedule(function()
  --             vim.snippet.jump(-1)
  --           end)
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --   end,
  -- },
  --
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
        "bash-debug-adapter",
        "html-lsp",
        "jsonlint",
        "json-lsp",
        "lemminx",
        "prettier",
        "shellcheck",
        "xmlformatter",
        "yaml-language-server",
        "yamllint",
        "yamlfix",
      })
    end,
  },
  -- NOTE: LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          filetypes = { "sh", "zsh" },
        },
        html = {},
        jsonls = {},
        lemminx = {},
        yamlls = {},
      },
    },
  },
  -- NOTE: TREESITTER
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add more
      vim.list_extend(opts.ensure_installed, {
        "xml",
      })
    end,
  },
  -- NOTE: FORMATTERS
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        xml = { "xmlformat" },
        yaml = { "yamlfix" },
      },
    },
  },
  -- NOTE: LINTER
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        html = { "markuplint" },
        yaml = { "yamllint" },
      },
    },
  },

  -- {
  --   "garymjr/nvim-snippets",
  --   keys = {
  --     {
  --       "<Tab>",
  --       function()
  --         if vim.snippet.active({ direction = -1 }) then
  --           vim.schedule(function()
  --             vim.snippet.jump(-1)
  --           end)
  --           return
  --         end
  --         return "<Tab>"
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --     },
  --     {
  --       "<Tab>",
  --       function()
  --         vim.schedule(function()
  --           vim.snippet.jump(-1)
  --         end)
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = "s",
  --     },
  --     {
  --       "<S-Tab>",
  --       function()
  --         if vim.snippet.active({ direction = 1 }) then
  --           vim.schedule(function()
  --             vim.snippet.jump(1)
  --           end)
  --           return
  --         end
  --         return "<S-Tab>"
  --       end,
  --       expr = true,
  --       silent = true,
  --       mode = { "i", "s" },
  --     },
  --   },
  -- },
}
