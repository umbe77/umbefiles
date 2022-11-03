require("orgmode").setup_ts_grammar()
require("orgmode").setup({
	org_agenda_files = { "~/my-orgs/**/*" },
	org_default_notes_file = "~/my-orgs/refile.org",
	mappings = {
		org = {
			org_insert_todo_heading = "oit",
			org_time_stamp = "<Leader>oq",
			org_todo = "<Leader>od",
			org_open_at_point = "<Leader>ow",
			org_do_promote = "<Leader>,",
			org_do_demote = "<Leader>.",
			org_promote_subtree = "<Leader>,q",
			org_demote_subtree = "<Leader>.q",
			org_show_help = "?",
		},
	},
})

require("org-bullets").setup({
	symbols = {
		headlines = { "◉", "○", "✸", "✿" },
	},
})

-- require"headlines".setup{}
