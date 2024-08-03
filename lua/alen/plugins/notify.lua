local M = {
  "rcarriga/nvim-notify",
}

function M.config()
  local notify = require("notify")

  notify.setup({
    render = "compact",
    timeout = 100,
    time_formats = {
      notification = "%T",
      notification_history = "%FT%T",
    },
    level = 2,
  })
end

return M
