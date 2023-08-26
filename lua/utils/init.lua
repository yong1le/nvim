local M = {}

function M.insert_unique(lst, vals)
  lst = lst or {} -- Make the list if not already

  -- If vals is a "string", change it to a list
  if not vim.tbl_islist(vals) then
    vals = { vals }
  end

  -- Make sure value doesn't already exist before inserting
  for _, val in ipairs(vals) do
    if not vim.tbl_contains(lst, val) then
      table.insert(lst, val)
    end
  end

  return lst
end

function M.merge(tbl, ext)
  tbl = tbl or {}
  tbl = vim.tbl_deep_extend("force", tbl, ext)
  return tbl
end

return M
