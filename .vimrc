syntax on
colorscheme desert256

set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " filetype
set statusline+=%=
set statusline+=%-14(%l,%c%V%)
set statusline+=%<%P

if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Blue
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

set hlsearch " highlight search
set incsearch " incremental search, search as you type
set smartcase " Ignore case when searching lowercase

set expandtab
set tabstop=4
set backspace=indent,eol,start
set showcmd

set nowrap
set linebreak " Wrap at word
set number
set vb t_vb=  " turn off bell!
set dir=~/.vim/tmp
highlight LineNr ctermfg=lightcyan

" imap jj <Esc>

filetype indent plugin on
" set cindent

au BufWinLeave juleøltest.txt mkview
au BufWinEnter juleøltest.txt silent loadview

au BufWritePre 2009.nanowrimo let &bex = '-' . strftime("%F-%H.%M.%S") . '~'
au BufWinEnter 2009.nanowrimo silent loadview
au BufWinLeave 2009.nanowrimo mkview
au BufRead,BufNewFile *.nanowrimo set filetype=nanowrimo
au! Syntax nanowrimo source /home/rolf/.vim/syntax/nanowrimo.vim

nnoremap <space> za

imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
nmap <F3> o<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
nmap <F4> g<C-G>

" Convenient go-to-end-of-line-key on norwegian keyboard.
map 0 $

" Put norwegian keys to use :)
map ø :
map æ @

" Autocommands
" " Read-only .doc through antiword
autocmd BufReadPre *.doc silent set ro
autocmd BufReadPost *.doc silent %!antiword "%"
"
" " Read-only odt/odp through odt2txt
autocmd BufReadPre *.odt,*.odp silent set ro
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"

au FileType help nnoremap <buffer><cr> <C-]> " Enter selects subject
au FileType help nnoremap <buffer><bs> <C-T> " Backspace to go back

autocmd FileType c set omnifunc=ccomplete#Complete

function! SuperCleverTab()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                return "\<Tab>"
        else
                if &omnifunc != ''
                        if &filetype == "c" || &filetype == "cpp"
                            return "\<C-N>"
                        else
                            return "\<C-X>\<C-O>"
                        endif
                elseif &dictionary != ''
                        return "\<C-K>"
                else
                        return "\<C-N>"
                endif
        endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

