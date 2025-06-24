
require'lspconfig'.lua_ls.setup{}

require'lspconfig'.qmlls.setup{
	filetypes = { 'qml', 'qmljs' }
}
