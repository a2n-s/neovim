local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.notify("Could not load properly 'notify' inside 'notify.greeting.lua'")
  return
end

local function rnd_msg()
-- NOTE: requires the fortune-mod package to work
	local handle  = io.popen("fortune")
	local fortune = handle:read("*a")
	handle:close()
	return fortune
end
local function system()
	local handle = io.popen("whoami")
	local who    = handle:read("*a")
	handle:close()
	return who
end

notify("Hi "..system().."Welcome back in Neovim!", vim.lsp.log_levels.DEBUG, { title = "Greetings " })
notify(rnd_msg(), vim.lsp.log_levels.INFO, { title = "A random tip..." })

