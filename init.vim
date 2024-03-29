" Mac specific!
set rtp+=/opt/homebrew/opt/fzf
set number
nnoremap JJ ]m
nnoremap KK [m
" nnoremap zz :update<cr> :edit<cr> :echo '"'.@%.'"'.'- Written '.getfsize(expand(@%)).'B (*).'<cr>
nnoremap zz :update<cr>
nnoremap <C-a> ggVG
vnoremap <C-c> "*y
nnoremap <C-v> "*p
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>
" lua require('init')
" BATTLING COC vs VIM for snippet!--------------------------------
" For disabling default keybind of moving through function snippet
" ONLY FIX -> .zshrc -> add line -> bindkey -r <quote>^J<end-quote>

" Presumably faster keybind than <C-j> for moving to next snippet
" let g:coc_snippet_next = '<A-j>'

" For moving single charater to left in INSERT mode
" Helps in quickly completing line by semi-colon
" ----------------------------------------------------------------

" Coc-Suggestions color scheme change ----------------------------
""" Customize colors -> get color list using ':hi'
func! s:my_colors_setup() abort
    " this is an example
    hi Pmenu guibg='Blue' ctermfg='White' ctermbg=17 gui=NONE
    hi CocMenuSel guibg='Blue' ctermbg='Brown' gui=NONE
    hi CocSearch ctermfg=220
	hi Comment ctermfg=216
	hi Terminal ctermfg='White'
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END
" ----------------------------------------------------------------

" Show line numbers in NerdTree
" :let g:NERDTreeShowLineNumbers=1
" :autocmd BufEnter Fern_* setlocal rnu
" let g:fern#renderer = "nerdfont"

" Exit terminal mode with ESC
:tnoremap <Esc> <C-\><C-n>

" Blinking bar in insert mode
" enable vertical cursor when in insert mode
set guicursor=i:ver1

" enable cursor blinking, if you want blinking for both then put a instead
" of i
set guicursor+=i:blinkon1

" FZF Bindings
nnoremap <silent> <C-p> :FZF -m<CR>

" inoremap ll <Right>
inoremap LL <Right>

inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" For quickly jumping out of INSERT mode
inoremap jj <ESC>

" For disabling bracket pairing for '<' since its used in cout alot
" without needing for a pair completion - <Plugin Based>
autocmd FileType * let b:coc_pairs_disabled = ["<"]

set statusline+=%F
set autoread
set relativenumber
set tabstop=4
set shiftwidth=4
set mouse=a
set autoindent

" Mac Specific!!
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

set autochdir
colorscheme default

" Font Specific!!
set guifont=Comic\ Code\ Ligatures:h17

" To compile and run code with F8
noremap <F8> <ESC> :w <CR> :!clang++ -std=c++17 -DONPC -O2 -o %< % && ./%< <CR>
inoremap <F8> <ESC> :w <CR> :!clang++ -std=c++17 -DONPC -O2 -o "%<" "%" && "./%<" <CR>

" To autoload and autosave vim sessions - <Plugin Based>
:let g:session_autoload = 'yes'
:let g:session_autosave = 'yes'

" Multiterm Config ---------------------------------------------
" Put the following lines in your configuration file to map <F12> to use Multiterm
nmap <C-\> <Plug>(Multiterm)
" In terminal mode `count` is impossible to press, but you can still use <F12>
" to close the current floating terminal window without specifying its tag
tmap <C-\> <Plug>(Multiterm)
" If you want to toggle in insert mode and visual mode
imap <C-\> <Plug>(Multiterm)
xmap <C-\> <Plug>(Multiterm)
if !exists('g:multiterm_opts')
    let g:multiterm_opts = {'term_hl': 'Terminal'}
endif

 " --------------------------------------------------------------

" set encoding=UTF-8

call plug#begin()

" Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'
if exists(':terminal')
    if has('nvim-0.4.0') || has('patch-8.2.191')
        Plug 'chengzeyi/multiterm.vim'
    endif
endif

call plug#end()


" Lua config for treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd[[hi @variable guifg=#fcba03 ctermfg=225]]
vim.cmd[[hi Function guifg=#fcba03 ctermfg=226]]
vim.cmd[[hi Keyword guifg=#fcba03 ctermfg=001]]
-- DEP: (method now same as func) vim.cmd[[hi Method guifg=#fcba03 ctermfg=226]]
vim.cmd[[hi Identifier guifg=#fcba03 ctermfg=039]]
vim.cmd[[hi Special guifg=#fcba03 ctermfg=Green]]
vim.cmd[[hi Operator guifg=#fcba03 ctermfg=208]]
vim.cmd[[hi FuncBuiltIn guifg=#fcba03 ctermfg=178]]
vim.cmd[[hi Literal guifg=#fcba03 ctermfg=060]]
vim.cmd[[hi Constant guifg=#fcba03 ctermfg=037]]
vim.cmd[[hi @type guifg=#fcba03 ctermfg=212]]
vim.cmd[[hi @type.builtin guifg=#fcba03 ctermfg=188]]
-- vim.cmd[[hi TSParameter guifg=#fcba03 ctermfg=Blue]]
EOF

" COC Config from here onwards...

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
1
3 3
1 2 2
1 3 4
1
1
3 3
1 2 2
1 3 4
1

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Latest 21 May 2023
