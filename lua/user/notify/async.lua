local async  = require("plenary.async")
local notify = require("notify").async

async.run(function()
  notify("Let's wait for this to close").close()
  notify("It closed!")
end)
