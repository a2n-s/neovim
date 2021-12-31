local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.notify("Could not load properly 'packer' inside 'plugins.lua'")
  return
end

local plugin = "My Awesome Plugin"

notify("This is an error message.\nSomething went wrong!", "error", {
	title = plugin,
	on_open = function()
		notify("Attempting recovery.", vim.lsp.log_levels.WARN, {
			title = plugin,
		})
		local timer = vim.loop.new_timer()
		timer:start(2000, 0, function()
			notify({ "Fixing problem.", "Please wait..." }, "info", {
				title = plugin,
				timeout = 3000,
				on_close = function()
					notify("Problem solved", nil, { title = plugin })
					notify("Error code 0x0395AF", 1, { title = plugin })
				end,
			})
		end)
	end,
})
