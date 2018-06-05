source $VIMRUNTIME/vimrc_example.vim
if filereadable("~/.vimrc.bundle")
    source ~/.vimrc.bundle
endif
set undodir=~/.vim/vimundo
set backupdir=~/.vim/vimbackup

set nu
set incsearch
set autoread
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4

syntax on
filetype on
filetype plugin on
filetype indent on
set shellslash

nmap <C-A> <ESC>ggVG"+y
nmap <F9> <ESC>:call Run()<CR>
nmap <F7> <ESC>:call SetTitle1()<CR>

iab xdate <C-R>=strftime("%F %R")<CR>

nmap <C-A> <ESC>ggVG"+y
nmap <F9> <ESC>:call Run()<CR>
nmap <F7> <ESC>:call SetTitle1()<CR>
nmap <F8> <ESC>:call SetTitle2()<CR>
nmap <F5> ggdG
nmap <F6> <ESC>:call Clear()<CR>

imap <C-A> <ESC>ggVG"+y
imap <F9> <ESC>:call Run()<CR>
imap <F7> <ESC>:call SetTitle1()<CR>
imap <F8> <ESC>:call SetTitle2()<CR>
imap <F5> ggdG
imap <F6> <ESC>:call Clear()<CR>

function! Run()
    exec "w"
    let exepath = ""
    if &filetype == 'c' || &filetype == 'cpp'
        let exepath = "!g++ -Wall -std=c++0x % -o %<.exe && ./%<.exe && rm %<.exe"
        "let exepath = "!clang-cl % -o %<.exe  && %<.exe && del %<.exe"
        execute exepath
    elseif &filetype == 'python'
        let exepath = "!python %"
        execute exepath
    elseif &filetype == 'java'
        let exepath = "!javac % && java %<"
        execute exepath
    elseif &filetype == 'html'
        exec "w"
    elseif &filetype == 'go'
        let exepath = "!go run %"
        execute exepath
    elseif &filetype == "tex"
        let exepath = "!pdflatex % && explorer %<.pdf"
        execute exepath
    endif
endfunction

function! Clear()
    exec "!del *.o *.exe *.cpp~ *.class *.aux *.log"
endfunction

func! SetTitle1()
    let l=0
    let l=l+1 | call setline(l,"#include<iostream>")
    let l=l+1 | call setline(l,'#include<cstdio>')
    let l=l+1 | call setline(l,'#include<cstring>')
    let l=l+1 | call setline(l,'#include<algorithm>')
    let l=l+1 | call setline(l,'#include<string>')
    let l=l+1 | call setline(l,'#include<cmath>')
    let l=l+1 | call setline(l,'#include<cstdlib>')
    let l=l+1 | call setline(l,'#include<vector>')
    let l=l+1 | call setline(l,'#include<set>')
    let l=l+1 | call setline(l,'#include<map>')
    let l=l+1 | call setline(l,'#include<queue>')
    let l=l+1 | call setline(l,'using namespace std;')
    let l=l+1 | call setline(l,'typedef long long ll;')
    let l=l+1 | call setline(l,'')
    let l=l+1 | call setline(l,'int main()')
    let l=l+1 | call setline(l,'{')
    let l=l+1 | call setline(l,'#ifndef ONLINE_JUDGE')
    let l=l+1 | call setline(l,"    //freopen(\"".expand("%:t:r").".in\",\"r\",stdin);")
    let l=l+1 | call setline(l,"    //freopen(\"".expand("%:t:r").".out\",\"w\",stdout);")
    let l=l+1 | call setline(l,'#endif')
    let l=l+1 | call setline(l,'')
    let l=l+1 | call setline(l,'    return 0;')
    let l=l+1 | call setline(l,'}')
endfunc

func! SetTitle2()
    let l=0
    let l=l+1 | call setline(l,'#include<bits/stdc++.h>')
    let l=l+1 | call setline(l,'using namespace std;')
    let l=l+1 | call setline(l,'typedef long long ll;')
    let l=l+1 | call setline(l,'')
    let l=l+1 | call setline(l,'int main()')
    let l=l+1 | call setline(l,'{')
    let l=l+1 | call setline(l,'#ifndef ONLINE_JUDGE')
    let l=l+1 | call setline(l,"    //freopen(\"".expand("%:t:r").".in\",\"r\",stdin);")
    let l=l+1 | call setline(l,"    //freopen(\"".expand("%:t:r").".out\",\"w\",stdout);")
    let l=l+1 | call setline(l,'#endif')
    let l=l+1 | call setline(l,'')
    let l=l+1 | call setline(l,'    return 0;')
    let l=l+1 | call setline(l,'}')
endfunc
