-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

-- local colorscheme = "darkplus"
-- local colorscheme = "darkplus"

-- vim.g.onedarker_italic_keywords = false

-- vim.g.onedarker_italic_functions = false

-- vim.g.onedarker_italic_comments = true

-- vim.g.onedarker_italic_loops = false

-- vim.g.onedarker_italic_conditionals = false

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
  -- vim.notify("colorscheme " .. colorscheme .. " not found!")
  -- return
-- end
