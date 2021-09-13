" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
    vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
    vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
    require'completion'.on_attach(client)
end

-- Enable rust_analyzer and pyright
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
nvim_lsp.pyright.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- Setup glow command
vim.cmd("command! -nargs=? -complete=file Glow :lua require('glow').glow('<f-args>')")

-- visual pleasers
require("toggleterm").setup{}

-- To auto install lsp servers
require'lspinstall'.setup()

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{ on_attach=on_attach }
end
EOF

autocmd BufEnter * lua require'completion'.on_attach()
