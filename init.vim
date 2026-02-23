"Vim-Plug Plugins
call plug#begin()
Plug 'slugbyte/lackluster.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'neovim/nvim-lspconfig'
Plug 'stevearc/oil.nvim'
Plug 'jiangmiao/auto-pairs'

call plug#end()
" Nvim Gruvbox Plugin config
set termguicolors
set background=dark
set clipboard=unnamedplus
let g:gruvbox_material_transparent_background=2
color gruvbox-material

" Key binding
nnoremap <C-q> :Oil <CR>
nnoremap <C-tab> :tabnew <CR>
nnoremap <M-x> :tabc <CR>k
nnoremap <C-Right> gt <CR>
nnoremap <C-Left> gT <CR>
nnoremap <C-Up> :m .-2<CR>==
nnoremap <C-Down> :m .+1<CR>==
inoremap <C-Up> <Esc>:m .-2<CR>==gi
inoremap <C-Down> <Esc>:m .+1<CR>==gi
vnoremap <C-Up> :m '<-2<CR>gv==gv
vnoremap <C-Down> :m '>+1<CR>gv==gv
tnoremap <Esc> <C-\><C-n> <CR>

" Nvim Config
set number
"set cmdheight=0
" Auto reloads the config file after editing it
autocmd BufWritePost init.vim source init.vim



" Using Lua
lua << END
require('lualine').setup({
	options = {
		section_separators = '',
	},
	sections = {
		lualine_x = {'encoding', 'fileformat', 'lsp_status', 'filetype'},
	}
})
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	default_file_explorer = true,
	keymaps = {
		["<CR>"] = {
		callback = function()
			local entry = require("oil").get_cursor_entry()
			if entry and entry.type == "file" then
				require("oil.actions").select.callback({ tab = true ,close = true})
			else
				require("oil.actions").select.callback()
			end
		end,
		},
		["q"] = {
		callback = function()
			require("oil.actions").close.callback()
		end,
		},
	},
	
})
END
