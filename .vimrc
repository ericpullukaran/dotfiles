set mouse=r

"language en_AU

inoremap kj <Esc>
"xnoremap kj <Esc>  " interferes with visual block mode
snoremap kj <Esc>

set number                      " enable line numbers
colorscheme ron

set expandtab                   " expand tabs to spaces
set shiftwidth=4                " spaces to shift when re-indenting
set tabstop=4                   " number of spaces to insert when tab is pressed
set softtabstop=4               " backspace deletes indent
set smartindent                 " indent based on filetype
set linebreak                   " wrap long lines at characters in 'breakat'
set breakindent                 " wrapped text is indented

set ignorecase                  " for search patterns
set smartcase                   " don't ignore case if capital is used

set undofile                    " undo persists after closing file

set splitright                  " puts new vsplit windows to the right of the current

set splitbelow                  " puts new split windows to the bottom of the current

