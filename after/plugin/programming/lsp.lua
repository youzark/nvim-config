-- Base plugin for lsp server management
-- Plugin : mason [must before setup mason-lspconfig]
local masonExist, mason = pcall(require, "mason")
if masonExist then
	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
end

-- lsp-server auto installation updation and setup
-- Plugin : mason-lspconfig [ if need lsp-config , must require after this plugin ]
local status, mason_lspconfig = pcall(require, "mason-lspconfig")
local cmp_nvim_lspExist, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status and cmp_nvim_lspExist then

	-- Table of severs that is automatically installed and corresponding setting
	-- :h lspconfig-all for specific configuration of certain lsp server
	local servers = {
		lua_ls= {
			Lua = {
				workspace = {
					library = vim.api.nvim_get_runtime_file('', true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
				diagnostic = {
					globals = {
						'vim',
						'use',
					}
				}
			},
		},
		clangd = {
			cmd = { 'clangd' },
			filetypes = { "c", "cpp", "cuda" },
		},
		marksman = {},
		pyright = {},
	}

	-- on_attach : functions get run when an Lsp connects to a particular buffer.
	-- pass a parameter to mason_lspconfig.set_handlers to set up options automatically.
	local on_attach = function(_, bufnr)
		local nmap = function(keys, func, desc)
			if desc then
				desc = 'Lsp: ' .. desc
			end
			vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
		end

		local telescopeExist, telescopeBuiltin = pcall(require, 'telescope.builtin')
		nmap('<leader>rn', vim.lsp.buf.rename, "[R]e[n]ame")
		nmap('<leader>ga', vim.lsp.buf.code_action, "code [A]ction")
		if telescopeExist then
			nmap('gd', telescopeBuiltin.lsp_definitions, "[G]oto [D]efinition")
			nmap('gD', telescopeBuiltin.diagnostics, "[G]oto [D]iagnostics")
			nmap('gr', telescopeBuiltin.lsp_references, "[G]oto [R]eference")
			nmap('?', telescopeBuiltin.lsp_document_symbols, "Document symble")
			nmap('gi', telescopeBuiltin.lsp_implementations, "[G]oto [I]mplementation")
		end
		nmap('<leader>d', vim.lsp.buf.type_definition, "Type definition")
		nmap('<leader>k', vim.lsp.buf.hover, "Hover Document")
		nmap('<leader>sg', vim.lsp.buf.signature_help, "Signature Document")
		nmap('<leader>f', vim.lsp.buf.format, "Format current buffer")
	end
	mason_lspconfig.setup {
		ensure_installed = vim.tbl_keys(servers)
	}
	mason_lspconfig.setup_handlers {
		function(server_name)
			require('lspconfig')[server_name].setup {
				capabilities = cmp_nvim_lsp.default_capabilities(),
				on_attach = on_attach,
				settings = servers[server_name],
			}
		end
	}
end

-- autocompletion engine configuration
-- Plugin : nvim-cmp [ lsp compatibility part is shifted to mason-lspconfig ]
local cmpExist, cmp = pcall(require, "cmp")
local luasnipExist, luasnip = pcall(require, "luasnip")
if cmpExist and luasnipExist then

	-- default setup [can also set up per filetype , i.g. below]
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
		},
		mapping = cmp.mapping.preset.insert({
			['<CR>'] = cmp.mapping.confirm({ select = true }),
			['<Tab>'] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- elseif luasnip.expand_or_jumpable() then
					-- 	luasnip.expand()
					else
						fallback()
					end
				end, { 'i', 's' }),
			['<S-Tab>'] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.expand() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { 'i', 's' }),
		}),

		-- sources of the completion items listed, the order of sources is the
		-- order in completion results.
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' }, -- completion source of words appared in the current buffer
			{ name = 'path' }
		}),
	})
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' },
			{ name = 'cmdline' },
		})
	})
end

-- lsp status information
-- Plugin : fidget
local fidgetExist, fidget = pcall(require, "fidget")
if fidgetExist then
	fidget.setup()
end

-- lsp support for nvim builtin lua functions
-- Plugin : neodev
local neodevExist, neodev = pcall(require, "neodev")
if neodevExist then
	neodev.setup()
end
