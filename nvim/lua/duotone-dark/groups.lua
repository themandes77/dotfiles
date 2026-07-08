local M = {}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup(C)
  -- Editor
  hl("Normal",        { fg = C.fg1, bg = C.bg1 })
  hl("NormalFloat",   { fg = C.fg1, bg = C.bg2 })
  hl("NormalSB",      { fg = C.fg1, bg = C.bg1 })
  hl("EndOfBuffer",   { fg = C.bg3 })
  hl("NonText",       { fg = C.fg3 })
  hl("Whitespace",    { fg = C.fg3 })
  hl("Conceal",       { fg = C.fg2 })

  -- Cursor
  hl("Cursor",        { fg = C.bg1, bg = C.accent })
  hl("lCursor",       { fg = C.bg1, bg = C.accent })
  hl("CursorIM",      { fg = C.bg1, bg = C.accent })
  hl("CursorLine",    { bg = C.bg2 })
  hl("CursorLineNr",  { fg = C.fg1, bg = C.bg2, bold = true })
  hl("CursorColumn",  { bg = C.bg2 })
  hl("ColorColumn",   { bg = C.bg2 })

  -- Line numbers
  hl("LineNr",        { fg = C.fg3 })
  hl("SignColumn",    { fg = C.fg3, bg = C.bg1 })

  -- Visual
  hl("Visual",        { bg = C.visual })
  hl("VisualNOS",     { bg = C.visual })
  hl("MatchParen",    { fg = C.accent, bold = true })
  hl("Search",        { fg = C.bg1, bg = C.search })
  hl("IncSearch",     { fg = C.bg1, bg = C.accent })
  hl("CurSearch",     { fg = C.bg1, bg = C.accent })
  hl("Substitute",    { fg = C.bg1, bg = C.search })

  -- Splits / Status / Tab
  hl("WinSeparator",  { fg = C.border })
  hl("VertSplit",     { fg = C.border })
  hl("StatusLine",    { fg = C.fg2, bg = C.bg2 })
  hl("StatusLineNC",  { fg = C.fg3, bg = C.bg1 })
  hl("TabLine",       { fg = C.fg1, bg = C.bg0 })
  hl("TabLineFill",   { bg = C.bg0 })
  hl("TabLineSel",    { fg = C.fg0, bg = C.bg2 })

  -- Popup menu
  hl("Pmenu",         { fg = C.fg1, bg = C.bg2 })
  hl("PmenuSel",      { fg = C.bg1, bg = C.fg1 })
  hl("PmenuSbar",     { bg = C.bg3 })
  hl("PmenuThumb",    { bg = C.fg3 })
  hl("WildMenu",      { fg = C.bg1, bg = C.fg1 })

  -- Messages
  hl("Question",      { fg = C.cyan })
  hl("ModeMsg",       { fg = C.fg1 })
  hl("MsgArea",       { fg = C.fg1 })
  hl("MoreMsg",       { fg = C.green })
  hl("WarningMsg",    { fg = C.warning })
  hl("ErrorMsg",      { fg = C.error, bold = true })

  -- Misc
  hl("Title",         { fg = C.func, bold = true })
  hl("Directory",     { fg = C.cyan })
  hl("SpecialKey",    { fg = C.fg3 })
  hl("Italic",        { italic = true })

  -- Spell
  hl("SpellBad",      { sp = C.error, undercurl = true })
  hl("SpellCap",      { sp = C.warning, undercurl = true })
  hl("SpellLocal",    { sp = C.info, undercurl = true })
  hl("SpellRare",     { sp = C.hint, undercurl = true })

  -- Diff
  hl("DiffAdd",       { fg = C.diff_add_fg, bg = C.diff_add })
  hl("DiffChange",    { fg = C.diff_change_fg, bg = C.diff_change })
  hl("DiffDelete",    { fg = C.diff_delete_fg, bg = C.diff_delete })
  hl("DiffText",      { fg = C.diff_change_fg, bg = C.diff_change, bold = true })

  -- Fold
  hl("Folded",        { fg = C.fg2, bg = C.bg2 })
  hl("FoldColumn",    { fg = C.fg3, bg = C.bg1 })

  -- Syntax
  hl("Comment",       { fg = C.comment, italic = true })
  hl("SpecialComment",{ fg = C.comment, italic = true })

  hl("Constant",      { fg = C.const })
  hl("String",        { fg = C.string })
  hl("Character",     { fg = C.string })
  hl("Number",        { fg = C.number })
  hl("Boolean",       { fg = C.number })
  hl("Float",         { fg = C.number })

  hl("Identifier",    { fg = C.fg1 })
  hl("Function",      { fg = C.func })

  hl("Statement",     { fg = C.keyword })
  hl("Conditional",   { fg = C.keyword })
  hl("Repeat",        { fg = C.keyword })
  hl("Label",         { fg = C.keyword })
  hl("Operator",      { fg = C.keyword })
  hl("Keyword",       { fg = C.keyword })
  hl("Exception",     { fg = C.keyword })

  hl("PreProc",       { fg = C.type })
  hl("Include",       { fg = C.type })
  hl("Define",        { fg = C.type })
  hl("Macro",         { fg = C.type })
  hl("PreCondit",     { fg = C.type })

  hl("Type",          { fg = C.type })
  hl("StorageClass",  { fg = C.keyword })
  hl("Structure",     { fg = C.type })
  hl("Typedef",       { fg = C.type })

  hl("Special",       { fg = C.accent })
  hl("SpecialChar",   { fg = C.accent })
  hl("Tag",           { fg = C.keyword })
  hl("Delimiter",     { fg = C.fg2 })
  hl("Debug",         { fg = C.keyword })

  hl("Underlined",    { fg = C.func, underline = true })
  hl("Ignore",        { fg = C.fg3 })
  hl("Error",         { fg = C.error, bold = true })
  hl("Todo",          { fg = C.bg1, bg = C.yellow, bold = true })

  -- Treesitter
  hl("@comment",               { fg = C.comment, italic = true })
  hl("@comment.error",         { fg = C.error })
  hl("@comment.warning",       { fg = C.warning })
  hl("@comment.todo",          { fg = C.yellow, bold = true })
  hl("@comment.note",          { fg = C.info })

  hl("@constant",              { fg = C.const })
  hl("@constant.builtin",      { fg = C.const })
  hl("@constant.macro",        { fg = C.const })

  hl("@string",                { fg = C.string })
  hl("@string.escape",         { fg = C.accent })
  hl("@string.regex",          { fg = C.yellow })
  hl("@string.special",        { fg = C.yellow })

  hl("@character",             { fg = C.string })
  hl("@character.special",     { fg = C.accent })

  hl("@number",                { fg = C.number })
  hl("@boolean",               { fg = C.number })
  hl("@float",                 { fg = C.number })

  hl("@function",              { fg = C.func })
  hl("@function.builtin",      { fg = C.func })
  hl("@function.call",         { fg = C.func })
  hl("@function.macro",        { fg = C.accent })
  hl("@function.method",       { fg = C.func })
  hl("@function.method.call",  { fg = C.func })

  hl("@parameter",             { fg = C.fg1 })
  hl("@parameter.reference",   { fg = C.fg1 })

  hl("@method",                { fg = C.func })
  hl("@field",                 { fg = C.fg1 })
  hl("@property",              { fg = C.blue })

  hl("@constructor",           { fg = C.type })

  hl("@conditional",           { fg = C.keyword })
  hl("@repeat",                { fg = C.keyword })
  hl("@label",                 { fg = C.keyword })
  hl("@operator",              { fg = C.keyword })
  hl("@keyword",               { fg = C.keyword })
  hl("@keyword.import",        { fg = C.keyword })
  hl("@keyword.repeat",        { fg = C.keyword })
  hl("@keyword.return",        { fg = C.keyword })
  hl("@keyword.exception",     { fg = C.keyword })
  hl("@keyword.function",      { fg = C.keyword })
  hl("@keyword.operator",      { fg = C.keyword })
  hl("@keyword.storage",       { fg = C.keyword })
  hl("@keyword.directive",     { fg = C.type })
  hl("@keyword.directive.define", { fg = C.type })

  hl("@punctuation.delimiter", { fg = C.fg2 })
  hl("@punctuation.bracket",   { fg = C.fg1 })
  hl("@punctuation.special",   { fg = C.keyword })

  hl("@string.special.symbol", { fg = C.const })
  hl("@string.special.url",    { fg = C.func, underline = true })

  hl("@type",                  { fg = C.type })
  hl("@type.builtin",          { fg = C.type })
  hl("@type.definition",       { fg = C.type })
  hl("@type.qualifier",        { fg = C.keyword })

  hl("@attribute",             { fg = C.blue })
  hl("@variable",              { fg = C.fg1 })
  hl("@variable.builtin",      { fg = C.const })
  hl("@variable.parameter",    { fg = C.fg1 })
  hl("@variable.member",       { fg = C.fg1 })

  hl("@tag",                   { fg = C.keyword })
  hl("@tag.attribute",         { fg = C.blue })
  hl("@tag.delimiter",         { fg = C.fg2 })

  hl("@emphasis",              { italic = true })
  hl("@emphasis.strong",       { bold = true })
  hl("@emphasis.underline",    { underline = true })
  hl("@emphasis.strikethrough",{ strikethrough = true })
  hl("@emphasis.italic",       { italic = true })
  hl("@emphasis.bold",         { bold = true })

  hl("@math",                  { fg = C.number })
  hl("@none",                  {})
  hl("@markup.heading",        { fg = C.func, bold = true })
  hl("@markup.heading.1",      { fg = C.red, bold = true })
  hl("@markup.heading.2",      { fg = C.func, bold = true })
  hl("@markup.heading.3",      { fg = C.blue, bold = true })
  hl("@markup.heading.4",      { fg = C.type, bold = true })
  hl("@markup.heading.5",      { fg = C.const, bold = true })
  hl("@markup.heading.6",      { fg = C.fg1, bold = true })
  hl("@markup.list",           { fg = C.fg1 })
  hl("@markup.list.checked",   { fg = C.green })
  hl("@markup.list.unchecked", { fg = C.fg2 })
  hl("@markup.raw",            { fg = C.string })
  hl("@markup.link",           { fg = C.cyan, underline = true })
  hl("@markup.link.url",       { fg = C.func, underline = true })
  hl("@markup.link.label",     { fg = C.fg1 })
  hl("@markup.quote",          { fg = C.fg2 })
  hl("@markup.strikethrough",  { strikethrough = true })
  hl("@markup.strong",         { bold = true })
  hl("@markup.underline",      { underline = true })
  hl("@markup.italic",         { italic = true })
  hl("@diff.plus",             { fg = C.green })
  hl("@diff.minus",            { fg = C.red })
  hl("@diff.delta",            { fg = C.blue })

  -- LSP
  hl("DiagnosticError",       { fg = C.error })
  hl("DiagnosticWarn",        { fg = C.warning })
  hl("DiagnosticInfo",        { fg = C.info })
  hl("DiagnosticHint",        { fg = C.hint })
  hl("DiagnosticOk",          { fg = C.green })

  hl("DiagnosticUnderlineError", { sp = C.error, undercurl = true })
  hl("DiagnosticUnderlineWarn",  { sp = C.warning, undercurl = true })
  hl("DiagnosticUnderlineInfo",  { sp = C.info, undercurl = true })
  hl("DiagnosticUnderlineHint",  { sp = C.hint, undercurl = true })
  hl("DiagnosticUnderlineOk",    { sp = C.green, underline = true })

  hl("DiagnosticVirtualTextError", { fg = C.error })
  hl("DiagnosticVirtualTextWarn",  { fg = C.warning })
  hl("DiagnosticVirtualTextInfo",  { fg = C.info })
  hl("DiagnosticVirtualTextHint",  { fg = C.hint })

  hl("DiagnosticFloatingError", { fg = C.error })
  hl("DiagnosticFloatingWarn",  { fg = C.warning })
  hl("DiagnosticFloatingInfo",  { fg = C.info })
  hl("DiagnosticFloatingHint",  { fg = C.hint })

  hl("DiagnosticSignError", { fg = C.error })
  hl("DiagnosticSignWarn",  { fg = C.warning })
  hl("DiagnosticSignInfo",  { fg = C.info })
  hl("DiagnosticSignHint",  { fg = C.hint })

  hl("LspReferenceText",      { bg = C.bg2 })
  hl("LspReferenceRead",      { bg = C.bg2 })
  hl("LspReferenceWrite",     { bg = C.bg2 })

  hl("LspCodeLens",           { fg = C.fg2 })
  hl("LspCodeLensSeparator",  { fg = C.fg3 })

  hl("LspSignatureActiveParameter", { fg = C.accent, bold = true })

  hl("FloatBorder",   { fg = C.border, bg = C.bg2 })
  hl("FloatTitle",    { fg = C.fg1, bg = C.bg2, bold = true })

  -- Telescope
  hl("TelescopePromptTitle",      { fg = C.bg1, bg = C.accent, bold = true })
  hl("TelescopePromptBorder",     { fg = C.border })
  hl("TelescopePromptPrefix",     { fg = C.accent })
  hl("TelescopePromptNormal",     { fg = C.fg1, bg = C.bg2 })
  hl("TelescopeResultsTitle",     { fg = C.fg2, bg = C.bg2 })
  hl("TelescopeResultsBorder",    { fg = C.border })
  hl("TelescopeResultsNormal",    { fg = C.fg1, bg = C.bg1 })
  hl("TelescopePreviewTitle",     { fg = C.bg1, bg = C.green, bold = true })
  hl("TelescopePreviewBorder",    { fg = C.border })
  hl("TelescopePreviewNormal",    { fg = C.fg1, bg = C.bg1 })
  hl("TelescopeSelection",        { bg = C.bg2 })
  hl("TelescopeSelectionCaret",   { fg = C.accent })
  hl("TelescopeMultiSelection",   { fg = C.fg1 })
  hl("TelescopeMultiIcon",        { fg = C.accent })
  hl("TelescopeMatching",         { fg = C.accent })

  -- Telescope file browser
  hl("TelescopeFileBrowserTitle",       { fg = C.fg2, bg = C.bg2 })
  hl("TelescopeFileBrowserBorder",      { fg = C.border })
  hl("TelescopeFileBrowserNormal",      { fg = C.fg1, bg = C.bg1 })
  hl("TelescopeFileBrowserSelection",   { bg = C.bg2 })

  -- NERDTree
  hl("NERDTreeDir",           { fg = C.cyan })
  hl("NERDTreeDirSlash",      { fg = C.cyan })
  hl("NERDTreeOpenable",      { fg = C.green })
  hl("NERDTreeClosable",      { fg = C.yellow })
  hl("NERDTreeFile",          { fg = C.fg1 })
  hl("NERDTreeExecFile",      { fg = C.green })
  hl("NERDTreeLink",          { fg = C.blue })
  hl("NERDTreeLinkTarget",    { fg = C.cyan })
  hl("NERDTreeFlag",          { fg = C.accent })
  hl("NERDTreeCWD",           { fg = C.func, bold = true })
  hl("NERDTreeHelp",          { fg = C.fg2 })
  hl("NERDTreeHelpTitle",     { fg = C.func, bold = true })
  hl("NERDTreeToggleOn",      { fg = C.green })
  hl("NERDTreeToggleOff",     { fg = C.red })

  -- WhichKey
  hl("WhichKey",              { fg = C.func })
  hl("WhichKeyGroup",         { fg = C.accent, bold = true })
  hl("WhichKeySeparator",     { fg = C.fg3 })
  hl("WhichKeyDesc",          { fg = C.fg1 })
  hl("WhichKeyFloat",         { bg = C.bg2 })
  hl("WhichKeyValue",         { fg = C.fg2 })

  -- Blink / Cmp
  hl("CmpItemAbbrDeprecated",   { fg = C.fg3, strikethrough = true })
  hl("CmpItemAbbrMatch",        { fg = C.accent, bold = true })
  hl("CmpItemAbbrMatchFuzzy",   { fg = C.accent })
  hl("CmpItemKindDefault",      { fg = C.fg2 })
  hl("CmpItemKindFunction",     { fg = C.func })
  hl("CmpItemKindMethod",       { fg = C.func })
  hl("CmpItemKindConstructor",  { fg = C.type })
  hl("CmpItemKindVariable",     { fg = C.fg1 })
  hl("CmpItemKindField",        { fg = C.fg1 })
  hl("CmpItemKindProperty",     { fg = C.blue })
  hl("CmpItemKindKeyword",      { fg = C.keyword })
  hl("CmpItemKindSnippet",      { fg = C.accent })
  hl("CmpItemKindText",         { fg = C.string })
  hl("CmpItemKindValue",        { fg = C.number })
  hl("CmpItemKindUnit",         { fg = C.fg2 })
  hl("CmpItemKindFile",         { fg = C.cyan })
  hl("CmpItemKindFolder",       { fg = C.cyan })
  hl("CmpItemKindEnum",         { fg = C.type })
  hl("CmpItemKindEnumMember",   { fg = C.blue })
  hl("CmpItemKindConstant",     { fg = C.const })
  hl("CmpItemKindStruct",       { fg = C.type })
  hl("CmpItemKindClass",        { fg = C.type })
  hl("CmpItemKindInterface",    { fg = C.blue })
  hl("CmpItemKindModule",       { fg = C.func })
  hl("CmpItemKindEvent",        { fg = C.accent })
  hl("CmpItemKindOperator",     { fg = C.keyword })
  hl("CmpItemKindReference",    { fg = C.fg2 })
  hl("CmpItemKindTypeParameter",{ fg = C.type })
  hl("CmpItemKindColor",        { fg = C.accent })

  -- Fidget
  hl("FidgetTask",             { fg = C.fg2 })
  hl("FidgetTitle",            { fg = C.func, bold = true })

  -- ToggleTerm
  hl("Terminal",              { fg = C.fg1, bg = C.bg1 })

  -- nvim-ufo / Fold
  hl("UfoFoldedFg",           { fg = C.fg2 })
  hl("UfoFoldedBg",           { bg = C.bg2 })
  hl("UfoPreviewSbar",        { bg = C.bg3 })
  hl("UfoPreviewThumb",       { bg = C.fg3 })
  hl("UfoPreviewWinBar",      { fg = C.fg1, bg = C.bg2 })

  -- Oil
  hl("OilModified",       { fg = C.accent })
  hl("OilFile",           { fg = C.fg1 })
  hl("OilDir",            { fg = C.cyan })
  hl("OilSymlink",        { fg = C.blue })
  hl("OilSpecial",        { fg = C.accent })

  -- indent-blankline
  hl("IblIndent",         { fg = C.fg3 })
  hl("IblScope",          { fg = C.fg2 })
  hl("IblWhitespace",     { fg = C.fg3 })

  -- ibuff (tabline style bufferline)
  hl("IBuffCurrent",               { fg = C.fg0 })
  hl("IBuffInactive",              { fg = C.fg2 })
  hl("IBuffBackground",            { bg = C.bg1 })
  hl("IBuffCurrentUnderline",      { fg = C.accent, underline = true })
  hl("IBuffModifiedCurrent",       { fg = C.fg0 })
  hl("IBuffModifiedInactive",      { fg = C.warning })
  hl("IBuffVisible",               { fg = C.fg1 })
  hl("IBuffVisibleUnderline",      { fg = C.fg2, underline = true })
  hl("IBuffSeparatorActive",       { fg = C.fg3 })
  hl("IBuffSeparatorInactive",     { fg = C.bg0 })
  hl("IBuffTabSeparator",          { fg = C.bg0 })
  hl("IBuffCloseButton",           { fg = C.fg2 })
  hl("IBuffCloseButtonHover",      { fg = C.error })
  hl("IBuffDevIconCurrent",        { fg = C.fg0 })
  hl("IBuffDevIconInactive",       { fg = C.fg2 })
  hl("IBuffDevIconModifiedCurrent", { fg = C.warning })
  hl("IBuffDevIconModifiedInactive", { fg = C.warning })
  hl("IBuffNumberCurrent",         { fg = C.fg2 })
  hl("IBuffNumberInactive",        { fg = C.fg3 })
  hl("IBuffNumberVisible",         { fg = C.fg2 })

  -- Render markdown
  hl("RenderMarkdownH1",     { fg = C.red, bold = true })
  hl("RenderMarkdownH2",     { fg = C.func, bold = true })
  hl("RenderMarkdownH3",     { fg = C.blue, bold = true })
  hl("RenderMarkdownH4",     { fg = C.type, bold = true })
  hl("RenderMarkdownH5",     { fg = C.const, bold = true })
  hl("RenderMarkdownH6",     { fg = C.fg1, bold = true })
  hl("RenderMarkdownCode",   { fg = C.string, bg = C.bg2 })
  hl("RenderMarkdownQuote",  { fg = C.fg2 })
  hl("RenderMarkdownList",   { fg = C.fg1 })
  hl("RenderMarkdownTableHead",  { fg = C.func, bold = true })
  hl("RenderMarkdownTableBody",  { fg = C.fg1 })
  hl("RenderMarkdownLink",   { fg = C.cyan, underline = true })
  hl("RenderMarkdownCheckChecked",  { fg = C.green })
  hl("RenderMarkdownCheckUnchecked", { fg = C.fg2 })

  -- Markdown (fallback for non-render-markdown)
  hl("markdownH1",               { fg = C.red, bold = true })
  hl("markdownH2",               { fg = C.func, bold = true })
  hl("markdownH3",               { fg = C.blue, bold = true })
  hl("markdownH4",               { fg = C.type, bold = true })
  hl("markdownH5",               { fg = C.const, bold = true })
  hl("markdownH6",               { fg = C.fg1, bold = true })
  hl("markdownCode",             { fg = C.string, bg = C.bg2 })
  hl("markdownCodeBlock",        { fg = C.string, bg = C.bg2 })
  hl("markdownLinkText",         { fg = C.cyan, underline = true })
  hl("markdownListMarker",       { fg = C.fg1 })
  hl("markdownOrderedListMarker",{ fg = C.fg1 })
  hl("markdownBlockquote",       { fg = C.fg2 })

  -- Vimwiki
  hl("VimwikiHeader1",    { fg = C.red, bold = true })
  hl("VimwikiHeader2",    { fg = C.func, bold = true })
  hl("VimwikiHeader3",    { fg = C.blue, bold = true })
  hl("VimwikiHeader4",    { fg = C.type, bold = true })
  hl("VimwikiHeader5",    { fg = C.const, bold = true })
  hl("VimwikiHeader6",    { fg = C.fg1, bold = true })
  hl("VimwikiLink",       { fg = C.cyan, underline = true })
  hl("VimwikiLinkT",      { fg = C.cyan, underline = true })
  hl("VimwikiList",       { fg = C.fg1 })
  hl("VimwikiCode",       { fg = C.string, bg = C.bg2 })
  hl("VimwikiNoExistsLink", { fg = C.error, underline = true })
  hl("VimwikiHR",         { fg = C.fg3 })
  hl("VimwikiBold",       { bold = true })
  hl("VimwikiItalic",     { italic = true })
  hl("VimwikiBoldItalic", { bold = true, italic = true })
  hl("VimwikiPre",        { fg = C.string, bg = C.bg2 })
  hl("VimwikiPreDelim",   { fg = C.fg3 })
  hl("VimwikiEq",         { fg = C.number })
  hl("VimwikiMath",       { fg = C.number })

  -- Mason
  hl("MasonHighlight",        { fg = C.func })
  hl("MasonHighlightBlock",   { fg = C.bg1, bg = C.func })
  hl("MasonHighlightBlockBold", { fg = C.bg1, bg = C.func, bold = true })
  hl("MasonMuted",            { fg = C.fg2 })
  hl("MasonMutedBlock",       { fg = C.bg1, bg = C.fg2 })
  hl("MasonHeader",           { fg = C.bg1, bg = C.accent, bold = true })
  hl("MasonHeaderSecondary",  { fg = C.bg1, bg = C.func, bold = true })
  hl("MasonError",            { fg = C.error })
  hl("MasonWarning",          { fg = C.warning })

  -- LSP inlay hints
  hl("LspInlayHint",         { fg = C.fg3, bg = C.bg2 })

  -- Misc plugins / standard UI
  hl("healthError",          { fg = C.error })
  hl("healthWarning",        { fg = C.warning })
  hl("healthSuccess",        { fg = C.green })

  hl("BufferVisible",        { fg = C.fg1, bg = C.bg1 })
  hl("BufferCurrent",        { fg = C.fg0, bg = C.bg2 })
  hl("BufferInactive",       { fg = C.fg2, bg = C.bg1 })

  hl("NvimTreeNormal",       { fg = C.fg1, bg = C.bg1 })
  hl("NvimTreeFolderName",   { fg = C.cyan })
  hl("NvimTreeOpenedFolderName", { fg = C.cyan, bold = true })
  hl("NvimTreeEmptyFolderName", { fg = C.fg2 })
  hl("NvimTreeFileDirty",    { fg = C.accent })
  hl("NvimTreeGitDirty",     { fg = C.accent })
  hl("NvimTreeGitStaged",    { fg = C.blue })
  hl("NvimTreeGitNew",       { fg = C.green })
  hl("NvimTreeGitDeleted",   { fg = C.red })
  hl("NvimTreeGitMerge",     { fg = C.accent })
  hl("NvimTreeGitIgnored",   { fg = C.fg3 })
  hl("NvimTreeRootFolder",   { fg = C.func, bold = true })
  hl("NvimTreeSpecialFile",  { fg = C.func, underline = true })
  hl("NvimTreeImageFile",    { fg = C.fg1 })
  hl("NvimTreeExecFile",     { fg = C.green })
  hl("NvimTreeSymlink",      { fg = C.blue })
  hl("NvimTreeWindowPicker", { fg = C.bg1, bg = C.accent })

  -- LuaSnip
  hl("LuasnipChoiceNode",         { fg = C.func })
  hl("LuasnipChoiceNodeActive",   { fg = C.bg1, bg = C.func })
  hl("LuasnipInsertNode",         { fg = C.accent })
  hl("LuasnipSnippet",            { fg = C.fg2 })
  hl("LuasnipSnippetActive",      { fg = C.fg1, bg = C.bg2 })
end

return M
