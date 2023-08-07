local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--> SET COMPETION ICONS (https://www.nerdfonts.com/cheat-sheet)
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

cmp.setup {
    --> LUASNIP
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    --> CUSTOM COMPLETION MAPPINGS
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),

		-- Cycle through the completion menu
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },

    --> FORMATTING THE COMPLETION MENU
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
            -- Set Icons to indicate the kind of the completion item
            item.kind = string.format("%s", kind_icons[item.kind])
			-- Show the source of which a completion item originates from
            item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return item
        end,
    },

    --> COMPLETION SOURCES
	-- The order of the sources matter in terms of priority.
	-- Additionaly you can configure:
    --    keyword_length
    --    priority
    --    max_item_count
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 5 },
    },

    --> DOCUMENTATION STYLE
    -- documentation = {
    --     border = require"general.misc".border,
    -- },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        winhighlight = 'Normal:Pmenu'
        -- TODO: Not Working? How to make CmpPmenu transparent
        -- winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
        -- winhighlight = 'NormalFloat:TelescopeNormal,FloatBorder:TelescopeBorder',
    },

    --> EXPERIMENTAL FEATURES
    experimental = {
        ghost_text = false,
        native_menu = false,
    },

    --> SET UP LSP CONFIG | TODO: Look into / Compare handler.lua.bak
    -- local cmp_lsp_status_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    -- if not cmp_lsp_status_ok then
    --     return
    -- end

    -- local capabilities = cmp_lsp.default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --     capabilities = capabilities
    -- }
}
