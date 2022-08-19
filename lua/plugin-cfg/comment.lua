local ok, comment = pcall(require, "Comment")
if not ok then
  vim.notify("Comment not found")
  return 
end

comment.setup()
