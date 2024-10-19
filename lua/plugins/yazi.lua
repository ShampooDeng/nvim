--- This file is a copy of https://github.com/Kicamon/nvim/blob/main/lua/internal/yazi.lua
local api = vim.api
local win = {}

---set float window's anchor
---@param opts table
---@return string anchor
local function make_floating_popup_anchor(opts)
  local anchor = ''

  anchor = anchor .. (opts.height >= 0 and 'N' or 'S')
  anchor = anchor .. (opts.width >= 0 and 'W' or 'E')

  return anchor or 'NW'
end

---set folating window's size
---@param opts table
---@param ui table {height: integer, width:integer}
---@return integer width
---@return integer height
local function make_floating_popup_size(opts, ui)
  opts.width = opts.width >= 0 and opts.width or -opts.width
  opts.height = opts.height >= 0 and opts.height or -opts.height

  opts.width = opts.width < 1 and math.floor(ui.width * opts.width + 0.5) or opts.width
  opts.height = opts.height < 1 and math.floor(ui.height * opts.height + 0.5) or opts.height

  opts.height, opts.width = math.min(opts.height, ui.height), math.min(opts.width, ui.width)

  return opts.width, opts.height
end

---get windows position
---@param opts table {row: char|integer, col: char|integer}
---@param ui table {height: integer, width:integer}
---@return integer row
---@return integer col
local function get_position(opts, ui)
  local row, col

  if type(opts.row) == 'number' then
    row = opts.row
  elseif opts.row == 'c' then
    row = math.floor((ui.height - opts.height + 0.5) / 2)
  elseif opts.row == 't' then
    row = 0
  elseif opts.row == 'b' then
    row = ui.height - 1
  end

  if type(opts.col) == 'number' then
    col = opts.col
  elseif opts.col == 'c' then
    col = math.floor((ui.width - opts.width + 0.5) / 2)
  elseif opts.col == 'l' then
    col = 0
  elseif opts.col == 'r' then
    col = ui.width
  end

  return row, col
end

---float window's config
---@param opts table
---@return table
local function make_floating_popup_options(opts)
  local ui = vim.api.nvim_list_uis()[1]
  local anchor = opts.anchor or make_floating_popup_anchor(opts)
  opts.width, opts.height = make_floating_popup_size(opts, ui)
  local row, col = get_position(opts, ui)

  return {
    anchor = anchor,
    bufpos = opts.relative == 'win' and opts.bufpos or nil,
    row = row,
    col = col,
    focusable = opts.focusable or true,
    relative = opts.relative or 'cursor',
    style = 'minimal',
    width = opts.width,
    height = opts.height,
    border = opts.border or 'rounded',
    title = opts.title or '',
    title_pos = opts.title_pos or 'center',
    zindex = opts.zindex or 50,
    noautocmd = opts.noautocmd or false,
  }
end

---default window's config
---@return table
local function default()
  return {
    style = 'minimal',
    border = 'rounded',
    noautocmd = false,
  }
end

---get window's information
---@return integer bunnr
---@return integer winid
function win:wininfo()
  return self.bufnr, self.winid
end

---creat float window
---@param float_opt table
---@param enter boolean
---@param force boolean
---@return table
function win:new_float(float_opt, enter, force)
  enter = enter or false

  -- buffer reuse
  self.bufnr = float_opt.bufnr or api.nvim_create_buf(false, false)
  float_opt.bufnr = nil
  float_opt = force and make_floating_popup_options(float_opt)
    or vim.tbl_extend('force', default(), float_opt)
  self.winid = api.nvim_open_win(self.bufnr, enter, float_opt)
  return self
end

--- quick set position
--- +-------------+--+-------------+--+--------------+
--- |             |  |             |  |              |
--- |     tl      |  |     tc      |  |      tr      |
--- |             |  |             |  |              |
--- +-------------+  +-------------+  +--------------+
--- |                                                |
--- +-------------+  +-------------+  +--------------+
--- |             |  |             |  |              |
--- |     cl      |  |     cc      |  |      cl      |
--- |             |  |             |  |              |
--- +-------------+  +-------------+  +--------------+
--- |                                                |
--- +-------------+  +-------------+  +--------------+
--- |             |  |             |  |              |
--- |     bl      |  |     bc      |  |      br      |
--- |             |  |             |  |              |
--- +-------------+--+-------------+--+--------------+

-- return win


-- local api = vim.api
-- local win = require('win')
local infos = {}

local function open_file(open, opt)
  if opt == 'left' then
    vim.cmd('set nosplitright')
  elseif opt == 'down' then
    vim.cmd('set splitbelow')
  elseif opt == 'up' then
    vim.cmd('set nosplitbelow')
  elseif opt == 'right' then
    vim.cmd('set splitright')
  end

  if vim.fn.filereadable(vim.fn.expand(infos.tempname)) == 1 then
    local filenames = vim.fn.readfile(infos.tempname)
    for _, filename in ipairs(filenames) do
      vim.cmd(open .. ' ' .. filename)
    end
  end
end

local function end_options()
  vim.fn.delete(infos.tempname)
  vim.cmd('silent! lcd ' .. infos.workpath)
end

local function yazi(open, opt)
  infos.workpath = vim.fn.getcwd()
  infos.filename = api.nvim_buf_get_name(0)
  infos.tempname = vim.fn.tempname()

  vim.cmd('silent! lcd %:p:h')

  local float_opt = {
    width = 0.8,
    height = 0.8,
    title = ' Yazi ',
    relative = 'editor',
    row = 'c',
    col = 'c',
  }

  -- BUG: E5108: Error executing lua: /home/shampoo/.config/nvim/lua/plugins/yazi.lua:234: Vim:Err or executing Lua callback: /home/shampoo/.config/nvim/lua/plugins/yazi.lua:195: cannot u se both 'scope' and 'buf' 
  -- if infos.bufnr then
  --   float_opt.bufnr = infos.bufnr
  --   api.nvim_set_option_value('modified', false, { scope = "local", buf=infos.bufnr })
  -- end

  infos.bufnr, infos.winid = win:new_float(float_opt, true, true):wininfo()

  vim.fn.termopen(string.format('yazi %s --chooser-file="%s"', infos.filename, infos.tempname), {
    on_exit = function()
      if api.nvim_win_is_valid(infos.winid) then
        api.nvim_win_close(infos.winid, true)
        infos.winid = nil
        open_file(open, opt)
      end
      end_options()
    end,
  })

  vim.cmd("startinsert")
end

local function setup()
  api.nvim_create_user_command('Yazi', function(args)
    if #args.args == 0 then
      yazi('edit')
    elseif args.args == 'left' then
      yazi('vsplit', 'left')
    elseif args.args == 'down' then
      yazi('split', 'down')
    elseif args.args == 'up' then
      yazi('split', 'up')
    elseif args.args == 'right' then
      yazi('vsplit', 'right')
    elseif args.args == 'tabe' then
      yazi('tabe')
    else
      error('Wrong parameters')
    end
  end, { nargs = '?' })

  vim.keymap.set('n', '<leader>j', function ()
    vim.cmd.Yazi{'tabe'}
  end, {})
  -- TODO: set keybinding only in the scope of the yazi term window.
  -- For open files in split windows, etc.
end

return { setup = setup }

