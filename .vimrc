" Copilot settings
imap <C-l> <Plug>(copilot-accept-word)
imap <C-n> <Plug>(copilot-next)

syntax enable
set number

" Set indentation settings
set tabstop=4       " Number of spaces a <Tab> in the file counts for
set softtabstop=4   " Number of spaces to use for a <Tab> key
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set expandtab       " Use spaces instead of tabs


" Highlight search results as you type
set incsearch

" Enable mouse support
set mouse=a

" Enable file type detection
filetype plugin indent on

" Enable clipboard support
set clipboard=unnamedplus

" Enable incremental search
set incsearch

" Set the background color
set background=dark

" Enable 256 colors
set t_Co=256

" Enable file type detection
filetype on

" Rainbow CSV settings
" Enable auto-detection for CSV-like files
let g:rainbow_csv_autodetect = 1

" Always use comma as the delimiter for CSV files
autocmd FileType csv let b:rainbow_csv_delim = ","

" Set filetype to CSV for .csv files
autocmd BufRead,BufNewFile *.csv set filetype=csv


function! GoToCSVColumnByTitle(title)
    " Save current position
    let l:save_cursor = getpos(".")
    " Go to the first line (header)
    execute "normal! gg"
    " Get the header line
    let l:header = getline(1)
    " Split the header line into fields
    let l:fields = split(l:header, ',\s*')
    " Find the index of the title (trim whitespace from the fields)
    let l:index = index(map(l:fields, 'trim(v:val)'), a:title)
    if l:index == -1
        " Column title not found, restore original position
        call setpos('.', l:save_cursor)
        return
    endif
    " Move to the original line
    call setpos('.', l:save_cursor)
    " Move to the beginning of the line
    normal! 0
    " Move to the target column
    let l:col = 0
    while l:col < l:index
        " Move right until the next comma
        call search(',', 'W')
        let l:col += 1
    endwhile
    " Move right to the beginning of the field
    normal! l
endfunction

" Completion function for column titles
function! CSVColumnComplete(A, L, P)
    let l:header = getline(1)
    let l:fields = split(l:header, ',\s*')
    return filter(map(l:fields, 'trim(v:val)'), 'v:val =~ "^" . a:A')
endfunction

" Map a command to call the function with Tab completion
command! -nargs=1 -complete=customlist,CSVColumnComplete GoToColumn call GoToCSVColumnByTitle(<f-args>)

