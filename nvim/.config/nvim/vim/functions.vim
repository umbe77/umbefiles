command! LspCodeAction lua require 'nv-utils'.code_action()
command! LspDeclaration lua require 'nv-utils'.declaration()
command! LspDefinition lua require 'nv-utils'.definition()
command! LspDocumentSymbol lua require 'nv-utils'.document_symbol()
command! LspFormatting lua require 'nv-utils'.formatting()
command! LspFormattingSync lua require 'nv-utils'.formatting_sync()
command! LspHover lua require 'nv-utils'.hover()
command! LspImplementation lua require 'nv-utils'.implementation()
command! LspRangeCodeAction lua require 'nv-utils'.range_code_action()
command! LspRangeFormatting lua require 'nv-utils'.range_formatting()
command! LspReferences lua require 'nv-utils'.references()
command! LspRename lua require 'nv-utils'.rename()
command! LspTypeDefinition lua require 'nv-utils'.type_definition()
command! LspWorkspaceSymbol lua require 'nv-utils'.workspace_symbol()
command! LspGotoNext lua require 'nv-utils'.goto_next()
command! LspGotoPrev lua require 'nv-utils'.goto_prev()
command! LspShowLineDiagnostics lua require 'nv-utils'.show_line_diagnostics()
command! NextHunk lua require 'nv-utils'.next_hunk()
command! PrevHunk lua require 'nv-utils'.prev_hunk()
command! StageHunk lua require 'nv-utils'.stage_hunk()
command! UndoStageHunk lua require 'nv-utils'.undo_stage_hunk()
command! ResetHunk lua require 'nv-utils'.reset_hunk()
command! ResetBuffer lua require 'nv-utils'.reset_buffer()
command! PreviewHunk lua require 'nv-utils'.preview_hunk()
command! BlameLine lua require 'nv-utils'.blame_line()
command! W noa w

" TODO find out why this thing follows me everywhere in java
let blacklist = ['java']
autocmd CursorHold,CursorHoldI * if index(blacklist, &ft) < 0 | lua require'nvim-lightbulb'.update_lightbulb()
