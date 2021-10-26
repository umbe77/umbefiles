require"orgmode".setup{
	org_agenda_files = {'~/my-orgs/**/*'},
	org_default_notes_file = '~/my-orgs/refile.org',
	mappings = {
		org = {
			org_insert_todo_heading = 'oit',
			org_time_stamp = '<Leader>oq',
		},
	},
}

require"org-bullets".setup{
    symbols = { "◉", "○", "✸", "✿" }
}

require"headlines".setup{}
