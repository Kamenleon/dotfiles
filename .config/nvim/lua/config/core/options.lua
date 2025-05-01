vim.cmd("let g:netrw_liststyle = 3") -- 3段まで出てくるようになった？ フォルダの表示が変わった

local opt = vim.opt

opt.relativenumber = true -- 行の相対的な位置が分かる。移動に便利そう
opt.number = true -- 行の絶対値が分かる

-- tabs & indentation
opt.tabstop = 2 -- 2 spacec for tabs (prettier dafault)
opt.shiftwidth = 2 -- 2spaces for indent width
opt.expandtab = true -- expand tab to spaces 
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- 長い行の扱いについて。falseなら折りたたまない。

-- search settings
-- 挙動が理解出来なかったら :h ignorecaseで調べ直すこと
opt.ignorecase = true -- ignore case when searching 
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true --現在の行を示す数字が白くなった。

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to user iterm2 or any other true color terminal
opt.termguicolors = true
opt.background = "dark" --colorshcemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text does't shift

-- backspace 
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

