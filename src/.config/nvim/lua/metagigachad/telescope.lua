local fb_utils = require 'telescope._extensions.file_browser.utils'
local action_state = require 'telescope.actions.state'
local Path = require 'plenary.path'

require('telescope').setup {
    defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        -- borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    },
    pickers = {
        -- find_files = {
        --     border = false,
        --     theme = 'ivy',
        -- },
    },
    extensions = {
        file_browser = {
            -- borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    ['<C-e>'] = function(prompt_bufnr)
                        local current_picker = action_state.get_current_picker(prompt_bufnr)
                        local finder = current_picker.finder
                        local bufr_path = Path:new(vim.fn.expand '#:p')
                        local bufr_parent_path = bufr_path:parent():absolute()

                        if finder.path ~= bufr_parent_path then
                            finder.path = bufr_parent_path
                            fb_utils.selection_callback(current_picker, bufr_path:absolute())
                        else
                            finder.path = vim.loop.cwd()
                        end
                        fb_utils.redraw_border_title(current_picker)
                        current_picker:refresh(finder, {
                            new_prefix = fb_utils.relative_path_prefix(finder),
                            reset_prompt = true,
                            multi = current_picker._multi,
                        })
                    end,
                },
            },
        },
    },
}

require('telescope').load_extension 'file_browser'
