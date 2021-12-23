local lualine = require'lualine'

-- COLOR SCHEME CONFIGURATION
-- local colors = {
--     -- Dracula_Pro
--     -- black = '#22212C',
--     -- Dracula_Pro_Helsing
--     -- blue   = '#9580FF',
--     -- cyan   = '#80FFEA',
--     -- black  = '#0B0D0F',
--     -- white  = '#f8f8f2',
--     -- red    = '#FF9580',
--     -- violet = '#9580FF',
--     -- grey   = '#454158',

-- 	-- GRUVBOX-FLAT
--     -- blue   = '#7daea3',
--     -- cyan   = '#89b482',
--     -- black  = '#32302f',
--     -- white  = '#d4be98',
--     -- red    = '#ea6962',
--     -- violet = '#d3869b',
--     -- grey   = '#3c3836',

--     -- MONOKAI PRO (SPECTRUM)
--     blue   = '#3399cc',
--     cyan   = '#5ad4e6',
--     black  = '#222222',
--     white  = '#f7f1ff',
--     red    = '#ff6188',
--     violet = '#ab9df2',
--     grey   = '#544f56',
-- }

-- -- THEME CONFIGURATION
-- local bubbles_theme = {
--     normal = {
--         a = { fg = colors.black, bg = colors.violet },
--         b = { fg = colors.white, bg = colors.grey },
--         c = { fg = colors.black, bg = colors.black },
--     },

--     insert = { a = { fg = colors.black, bg = colors.blue } },
--     visual = { a = { fg = colors.black, bg = colors.cyan } },
--     replace = { a = { fg = colors.black, bg = colors.red } },

--     inactive = {
--         a = { fg = colors.white, bg = colors.black },
--         b = { fg = colors.white, bg = colors.black },
--         c = { fg = colors.black, bg = colors.black },
--     },
-- }

-- -- SETUP BUBBLES
-- lualine.setup {
--     options = {
--         theme = bubbles_theme,
--         component_separators = '|',
--         section_separators = { left = '', right = '' },
--         disabled_filetypes = { "alpha", "NvimTree", "Outline" },
--     },
--     sections = {
--         lualine_a = {
--         { 'mode', separator = { left = '' }, right_padding = 2 },
--         },
--         lualine_b = { 'filename', 'branch' },
--         lualine_c = { 'fileformat' },
--         lualine_x = {},
--         lualine_y = { 'filetype', 'progress' },
--         lualine_z = {
--         { 'location', separator = { right = '' }, left_padding = 2 },
--         },
--     },
--     inactive_sections = {
--         lualine_a = { 'filename' },
--         lualine_b = {},
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = { 'location' },
--     },
--     tabline = {},
--     extensions = {},
-- }


-- MONOKAI PRO (SPECTRUM)
local colors = {
    bg       = '#222222',
    fg       = '#f7f1ff',
    yellow   = '#fce566',
    cyan     = '#5ad4e6',
    darkblue = '#3399cc',
    green    = '#7bd88f',
    orange   = '#fc9867',
    violet   = '#ab9df2',
    magenta  = '#ff6188',
    blue     = '#3399cc',
    red      = '#ff6188',
  }
  
  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand '%:t') ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand '%:p:h'
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }
  
  -- Config
  local config = {
    options = {
      -- Disable sections and component separators
      component_separators = '',
      section_separators = '',
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
      disabled_filetypes = { "alpha", "NvimTree", "Outline" },
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }
  
  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end
  
  -- Inserts a component in lualine_x ot right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end
  
  ins_left {
    function()
      return '▊'
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
  }
  
  ins_left {
    -- mode component
    function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red,
      }
      vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
      return ''
    end,
    color = 'LualineMode',
    padding = { right = 1 },
  }
  
  ins_left {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
  }
  
  ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
  }
  
  ins_left { 'location' }
  
  ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }
  
  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
  }
  
  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  ins_left {
    function()
      return '%='
    end,
  }
  
  ins_left {
    -- Lsp server name .
    function()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    icon = ' LSP:',
    color = { fg = '#ffffff', gui = 'bold' },
  }
  
  -- Add components to right sections
  ins_right {
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
  }
  
  ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' },
  }
  
  ins_right {
    'branch',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
  }
  
  ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  }
  
  ins_right {
    function()
      return '▊'
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
  }
  
  -- Now don't forget to initialize lualine
  lualine.setup(config)