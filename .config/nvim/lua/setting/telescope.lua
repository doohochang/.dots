local telescope = require('telescope')
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Sends selected items to quickfix list if there are more than one items.
local multi_select = function(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selection = table.getn(picker:get_multi_selection())

  if num_selection > 1 then
    actions.send_selected_to_qflist(prompt_bufnr)
    actions.open_qflist()
  else
    actions.file_edit(prompt_bufnr)
  end
end

return { 
  setup = function()
    telescope.load_extension('fzy_native')

    -- Sets additional mappings
    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
            ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
            ["<cr>"] = multi_select,
          },
          n = {
            ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
            ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
            ["<cr>"] = multi_select,
          },
        },
      },
    }
  end,
}
