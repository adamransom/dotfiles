vim.cmd("colorscheme bare")

-- Settings {{{
vim.g.mapleader = ","

vim.opt.background = "light"
vim.opt.termguicolors = true
vim.opt.spellcapcheck = ""
vim.opt.spelllang = "en_gb"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignore = { "**/.git/*" }
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.showbreak = "↪"
vim.opt.expandtab = true
vim.opt.formatoptions:append("j")
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.fillchars:append({ fold = " " })
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "indent"
vim.opt.number = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.completeopt = { "menu" }
vim.opt.mouse = ""

if vim.env.SUDO_USER then
  vim.opt.writebackup = false
  vim.opt.swapfile = false
end

vim.o.statusline = table.concat({
  "%r ",         -- Lock symbol if read only
  "%{adam#statusline#file_prefix()}",
  "%1*",         -- Switch to User1 highlight
  "%t ",         -- File name
  "%*",          -- Reset highlighting
  "%(%m%)",      -- Unsaved changes or not
  "%([%R%{adam#statusline#ft()}%{adam#statusline#fenc()}]%)",
  "%=",          -- Send the rest to the right
  "%l/%L:%c",    -- Line and column numbers
  " [%b][0x%B]", -- ASCII and HEX character code
}, '')
-- }}}

-- General Mappings {{{
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "w!!", 'w !sudo tee > /dev/null "%"')
vim.keymap.set("i", "<C-l>", "<space>=><space>")
vim.keymap.set("i", "jj", "<Esc>`^")
vim.keymap.set("i", "jk", "<Esc>`^")
vim.keymap.set("n", "<Enter>", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<Leader><Leader>", "<C-^>")
vim.keymap.set("n", "<Leader>ce", ":e <C-R>=expand('%:p:h')<CR>/")
vim.keymap.set("n", "<Leader>ve", ":e $MYVIMRC<CR>", { silent = true })
vim.keymap.set("v", "<Leader>s", ":sort<CR>", { silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n>]])
vim.keymap.set("x", "<Leader>y", '"+y')
-- }}}

-- Autocommands {{{
local vimrc = vim.api.nvim_create_augroup('vimrc', { clear = true })
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  pattern = "*",
  command = [[execute "normal! \<c-w>="]],
  group = vimrc,
})
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = 'quickfix',
  command = 'nnoremap <buffer> <CR> <CR>',
  group = vimrc,
})
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'gitcommit',
  command = 'setlocal spell',
  group = vimrc,
})
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'lua,help',
  callback = function()
    vim.treesitter.stop()
  end,
  group = vimrc,
})
-- }}}

-- Plugins {{{
require("paq") {
  "savq/paq-nvim",

  "github/copilot.vim",
  "janko-m/vim-test",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "justinmk/vim-dirvish",
  "madox2/vim-ai",
  "maxmellon/vim-jsx-pretty",
  "neovim/nvim-lspconfig",
  "ojroques/nvim-lspfuzzy",
  "shougo/neosnippet.vim",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-projectionist",
  "tpope/vim-repeat",
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "vim-scripts/camelcasemotion",
}
-- }}}

-- fzf {{{
vim.g.fzf_preview_window = ""

vim.keymap.set("n", "<Leader>t", ":Files<CR>")
vim.keymap.set("n", "<Leader>gt", ":Buffers<CR>")
-- }}}

-- vim-test {{{
vim.keymap.set("n", "<Leader>rr", ":w | TestFile<CR>")
vim.keymap.set("n", "<Leader>re", ":w | TestNearest<CR>")
vim.keymap.set("n", "<Leader>ra", ":w | TestSuite<CR>")
vim.keymap.set("n", "<Leader>rw", ":w | TestLast<CR>")
-- }}}

-- neo-snippet {{{
vim.g["neosnippet#snippets_directory"] = "~/.config/nvim/snippets"
vim.g["neosnippet#disable_runtime_snippets"] = { _ = 1 }

vim.keymap.set("i", "<TAB>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  elseif vim.fn["neosnippet#expandable_or_jumpable"]() == 1 then
    return "<Plug>(neosnippet_expand_or_jump)" 
  else
    return "<TAB>"
  end
end, { expr = true, remap = true })

vim.keymap.set("s", "<TAB>", function()
  if vim.fn["neosnippet#expandable_or_jumpable"]() then
    return "<Plug>(neosnippet_expand_or_jump)" 
  else
    return "<TAB>"
  end
end, { expr = true, remap = true })

vim.keymap.set("x", "<TAB>", "<Plug>(neosnippet_expand_target)")
-- }}}

-- lsp {{{
local lsp = require("lspconfig")

lsp.solargraph.setup({})
lsp.tsserver.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
})
lsp.eslint.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
  flags = {
    allow_incremental_sync = false,
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vimrc,
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  float = {
    focus = false,
    focusable = false,
    header = "",
  },
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "ge", vim.diagnostic.open_float)
vim.keymap.set("n", "<Leader>qf", vim.diagnostic.setqflist)
vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<Leader>f", function()
  vim.lsp.buf.format { async = true }
end)
-- }}}

-- lspfuzzy {{{
require("lspfuzzy").setup({
  fzf_preview = false,
})
-- }}}

-- copilot {{{
vim.keymap.set("i", "<C-J>", "copilot#Accept('<CR>')", {
  expr = true,
  replace_keycodes = false
})

vim.keymap.set("i", "<C-]>", "<Plug>(copilot-accept-word)")
vim.g.copilot_no_tab_map = true
-- }}}

-- vim-ai {{{
vim.g.vim_ai_edit = {
  ui = {
    paste_mode = 0,
  },
}
-- }}}

if vim.fn.filereadable(vim.fn.expand(".pvimrc")) == 1 then
  dofile(".pvimrc")
end

-- vim: foldmethod=marker foldlevel=0
