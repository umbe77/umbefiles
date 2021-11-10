local pickers = require "telescope.pickers"
local entry_display = require "telescope.pickers.entry_display"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local curl = require "plenary.curl"
local path = require "plenary.path"
local json = require "gitignore.json"

local notify = require "notify"

local gitIgnoreUrl = "https://www.toptal.com/developers/gitignore/api/list?format=json"

local M = {}

local function Split(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

local list = function()
	local response = curl["get"](gitIgnoreUrl)

	if (response.status == 200) then
		local languagesHash = json.decode(response.body)
        local languages = {}
        for _, value in pairs(languagesHash) do
            table.insert(languages, value)
        end
        return languages
	end

    return nil
end


local gitignore_files = function(opts)

    local displayer = entry_display.create {
        separator = " ",
        items = {
            { width = 65 },
            { remaining = true }
        }
    }

    local make_display = function(entry)
        return displayer {
            entry.name,
        }
    end

    pickers.new(opts, {
        prompt_title = ".gitignore",
        finder = finders.new_table {
            results = list(),
            entry_maker = function(entry)
                return {
                    display = make_display,
                    name = entry.name,
                    value = entry,
                    ordinal = entry.key,
                    contents = entry.contents,
                }
            end
        },
        previewer = previewers.new_buffer_previewer {
            define_preview = function(self, entry)
                local lines = Split(entry.contents, "\n")
                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, true, lines)
            end
        },
        sorter = sorters.get_fzy_sorter(opts),
        attach_mappings = function()
            actions.select_default:replace(function (prompt_bufnr)
                local entry = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                local gitignore = path:new(".gitignore")
                gitignore:write(entry.contents, "a")
                notify(string.format("%s gitignore added to .gitignore file", entry.name), "info", {
                    title = "gitignore"
                })
            end)
            return true
        end
    }):find()
end

function M.setup()
    vim.cmd('command GitIgnore lua require"gitignore".run()')
end

function M.run()
    gitignore_files()
end


return M
