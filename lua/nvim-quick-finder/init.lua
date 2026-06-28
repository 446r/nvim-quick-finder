local M = {}
local default_config = {
  ignore = { ".git/", ".svn/", "node_modules/", ".cache", "vendor/" },
  command = "Qf"
}
local config = {}

function M.exec(opts)
  local args = vim.split(opts.args, "%s+", { trimempty = true })
  local keyword = args[1] or ""
  local base_dir = args[2] or "."

  local raw_files = {}
  for entry, type in vim.fs.dir(base_dir, { depth = 100 }) do
    local path = base_dir .. "/" .. entry
    table.insert(raw_files, path)
  end

  local files = vim.iter(raw_files):filter(function(path)
    return not vim.iter(config.ignore):any(function(ignore)
      return path:find(ignore, 1, true) ~= nil
    end)
  end):totable()
  if keyword ~= "" then
    files = vim.fn.matchfuzzy(files, keyword)
  end
  table.sort(files)

  local qf_items = {}
  for _, path in ipairs(files) do
    table.insert(qf_items, { filename = path, valid = true })
  end
  vim.fn.setqflist({}, "r", { title = "Matched files: " .. keyword, items = qf_items })
  vim.cmd("copen")
end

function M.setup(user_config)
  config = vim.tbl_deep_extend("force", default_config, user_config or {})
  vim.api.nvim_create_user_command(config.command, M.exec, {
    nargs = "*",
    complete = "dir"
  })
end

return M
