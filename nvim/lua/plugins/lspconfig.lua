-- ============================================================================
-- LSP CONFIGURATION
-- ============================================================================
-- Mason + LSP setup with support for multiple languages including Rust & C++

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp", -- For completion capabilities
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      
      -- Check Neovim version for appropriate API
      local nvim_0_11 = vim.fn.has('nvim-0.11') == 1
      
      -- ========================================================================
      -- MASON-LSPCONFIG SETUP
      -- ========================================================================
      mason_lspconfig.setup({
        ensure_installed = {
          -- Scripting & Config
          "lua_ls",
          "vimls",
          "bashls",
          
          -- Web Development
          "html",
          "cssls",
          "ts_ls",
          "jsonls",
          
          -- Systems Programming
          "clangd",      -- C/C++
          "rust_analyzer", -- Rust
          
          -- Other Languages
          "pyright",     -- Python
          "gopls",       -- Go
        },
        automatic_installation = true,
      })
      
      -- ========================================================================
      -- LSP CAPABILITIES (for completion)
      -- ========================================================================
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- ========================================================================
      -- COMMON LSP ON_ATTACH (keymaps & options)
      -- ========================================================================
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        
        -- Navigation
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        
        -- Documentation
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        
        -- Code Actions
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>f', function() 
          vim.lsp.buf.format({ async = true })
        end, opts)
        
        -- Diagnostics
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
      end
      
      -- ========================================================================
      -- SERVER-SPECIFIC CONFIGURATIONS
      -- ========================================================================
      
      local server_configs = {
        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        
        -- Rust
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
              },
              checkOnSave = {
                command = "clippy",
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
        
        -- C/C++
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
          },
          init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
            semanticHighlighting = true,
          },
        },
        
        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        
        -- TypeScript/JavaScript
        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              }
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              }
            }
          }
        },
        
        -- Go
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
      }
      
      -- ========================================================================
      -- SETUP ALL SERVERS
      -- ========================================================================
      
      if nvim_0_11 then
        -- Use new vim.lsp.config API for Neovim 0.11+
        for server_name, config in pairs(server_configs) do
          vim.lsp.config(server_name, vim.tbl_extend('force', {
            capabilities = capabilities,
            on_attach = on_attach,
          }, config))
        end
        
        -- Enable servers without custom config
        for _, server_name in ipairs({
          "vimls", "bashls", "html", "cssls", "jsonls"
        }) do
          if not server_configs[server_name] then
            vim.lsp.config(server_name, {
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end
        end
        
        -- Enable all configured servers
        vim.lsp.enable({
          "lua_ls", "vimls", "pyright", "ts_ls", "html", "cssls",
          "bashls", "jsonls", "clangd", "rust_analyzer", "gopls"
        })
      else
        -- Use legacy lspconfig for older Neovim versions
        local lspconfig = require("lspconfig")
        
        for server_name, config in pairs(server_configs) do
          config.capabilities = capabilities
          config.on_attach = on_attach
          lspconfig[server_name].setup(config)
        end
        
        -- Setup servers without custom config
        for _, server_name in ipairs({
          "vimls", "bashls", "html", "cssls", "jsonls"
        }) do
          if not server_configs[server_name] then
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end
        end
      end
      
      -- ========================================================================
      -- DIAGNOSTIC CONFIGURATION
      -- ========================================================================
      vim.diagnostic.config({
        virtual_text = {
          prefix = '●',
          source = "if_many",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'always',
          header = '',
          prefix = '',
        },
      })
      
      -- Diagnostic signs
      local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " "
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
  
  -- ============================================================================
  -- JAVA JDTLS CONFIGURATION (Optional)
  -- ============================================================================
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local jdtls = require("jdtls")
      
      -- Workspace directory
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name
      
      -- Find jdtls jar
      local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
      local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      local config_dir = jdtls_path .. "/config_linux" -- Change to config_mac or config_win if needed
      
      local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens", "java.base/java.util=ALL-UNNAMED",
          "--add-opens", "java.base/java.lang=ALL-UNNAMED",
          "-jar", launcher_jar,
          "-configuration", config_dir,
          "-data", workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew", "pom.xml", "build.gradle"}),
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            completion = {
              favoriteStaticMembers = {
                "org.junit.Assert.*",
                "org.junit.Assume.*",
                "org.junit.jupiter.api.Assertions.*",
                "org.junit.jupiter.api.Assumptions.*",
                "org.junit.jupiter.api.DynamicTest.*",
              },
              filteredTypes = {
                "com.sun.*",
                "io.micrometer.shaded.*",
                "java.awt.*",
                "jdk.*",
                "sun.*",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
              },
              useBlocks = true,
            },
          },
        },
        init_options = {
          bundles = {},
        },
      }
      
      jdtls.start_or_attach(config)
    end,
  },
}
