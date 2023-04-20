-- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md#crash-course-the-vimode
local status = require "astronvim.utils.status"
local C = status.env.fallback_colors
local ViMode = {
  -- get vim current mode, this information will be required by the provider
  -- and the highlight functions, so we compute it only once per component
  -- evaluation and store it as a component attribute
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()
  end,
  -- Now we define some dictionaries to map the output of mode() to the
  -- corresponding string and color. We can put these into `static` to compute
  -- them at initialisation time.
  static = {
    mode_names = {
      n = "Normal",
      no = "Normal?",
      nov = "Normal?",
      noV = "Normal?",
      ["no\22"] = "Normal?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "NormalTer",
      v = "visual",
      vs = "Vs",
      V = "Visual",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "Insert",
      ic = "Ic",
      ix = "Ix",
      R = "Repalce",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "Command",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "Terminal",
    },
    mode_colors = {
      n = C.blue,
      i = C.green,
      v = C.purple,
      V = C.purple,
      ["\22"] = "cyan",
      c = C.bright_red,
      s = "purple",
      S = "purple",
      ["\19"] = "purple",
      R = "orange",
      r = "orange",
      ["!"] = C.bright_purple,
      t = C.green,
    },
  },
  -- We can now access the value of mode() that, by now, would have been
  -- computed by `init()` and use it to index our strings dictionary.
  -- note how `static` fields become just regular attributes once the
  -- component is instantiated.
  -- To be extra meticulous, we can also add some vim statusline syntax to
  -- control the padding and make sure our string is always at least 2
  -- characters long. Plus a nice Icon.
  provider = function(self) return " %2(" .. self.mode_names[self.mode] .. "  %)" end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = self.mode_colors[mode], bold = true }
  end,
  -- Re-evaluate the component only on ModeChanged event!
  -- Also allows the statusline to be re-evaluated when entering operator-pending mode
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function() vim.cmd "redrawstatus" end),
  },
}

return {
  statusline = {
    ViMode = ViMode,
  },
}
