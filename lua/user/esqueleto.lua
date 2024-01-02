require("esqueleto").setup(
    {
      -- Template directories
      directories = { vim.fn.stdpath("config") .. "/skeletons" },

      -- Patterns to match when creating new file
      -- Can be either (i) file names or (ii) file types.
      -- Exact file name match have priority
      patterns = { "html" },

      -- whether to auto-use a template if it's the only one for a pattern
      autouse = true
    }
)
