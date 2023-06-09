local ViMode = require("user.plugins.config.hairline").statusline.ViMode
return {
  "rebelot/heirline.nvim",
  opts = {
    statusline = {
      init = ViMode.init,
      static = ViMode.static,
      provider = ViMode.provider,
      hl = ViMode.hl,
      update = ViMode.update,
    },
  },
}
