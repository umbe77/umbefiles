local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require"nvim-treesitter.configs".setup {
    ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- TODO seems to be broken
    ignore_install = {"haskell"},
    highlight = {
        enable = true, -- false will disable the whole extension
    	disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    	additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
    },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    indent = {enable = {"javascriptreact", "lua", "go", "csharp"}},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    autotag = {enable = true},
    rainbow = {enable = true},
    context_commentstring = {enable = true, config = {javascriptreact = {style_element = '{/*%s*/}'}}}
    -- refactor = {highlight_definitions = {enable = true}}
}
