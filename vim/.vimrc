set nocompatible
""""""""""""""Vundle Begin"""""""""""""""""""""""""""""
filetype off

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"      execfile(activate_this, dict(__file__=activate_this))
"      EOF

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

"""" 文件跳转
Plugin 'kien/ctrlp.vim'
"""" 文件内搜索
Plugin 'tacahiroy/ctrlp-funky'

"""" for python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'davidhalter/jedi-vim'
"Plugin 'python-mode/python-mode'
"Plugin 'klen/python-mode'
"""" end

"""" 缩进指示线，不晓得是什么
Plugin 'Yggdroot/indentLine'

"""" 代码折叠
"Plugin 'tmhedberg/SimpylFold'

"YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

"""""nerdtree begin""""
Plugin 'scrooloose/nerdtree'  
Plugin 'Xuyuanp/nerdtree-git-plugin'  
Plugin 'jistr/vim-nerdtree-tabs'
"""""nerdtree end  """"

" markdown instant
Plugin 'suan/vim-instant-markdown'

" 语法检查
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

""""自动加括号
" Plugin 'jiangmiao/auto-pairs'

""""配色方案
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/powerline'
Plugin 'nightsense/stellarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/rainbow_parentheses.vim'

""""for LaTeX
"Plugin 'vim-latex/vim-latex'
"Plugin 'xuhdev/vim-latex-live-preview'

""""""""""""""""""""ctrlsf, 文件夹搜索"""""""""""""""""""""
Plugin 'dyng/ctrlsf.vim'

"""""""""""""tagbar
Plugin 'majutsushi/tagbar'
""""for golang
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""Vundle End"""""""""""""""""""""""""""""

"""""nerdtree begin""""
"使用F3键快速调出和隐藏它
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=33
" 修改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"How can I open a NERDTree automatically when vim starts up if no files were specified?
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 打开vim时自动打开NERDTree
" autocmd vimenter * NERDTree          "先不打开了，看起来好烦 
"How can I open NERDTree automatically when vim starts up on opening a directory?
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 开发的过程中，我们希望git信息直接在NERDTree中显示出来， 和Eclipse一样，修改的文件和增加的文件都给出相应的标注， 这时需要安装的插件就是 nerdtree-git-plugin,配置信息如下
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" 显示行号
let NERDTreeShowLineNumbers=0
let NERDTreeAutoCenter=1

" 在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1

"""" 语法高亮
let python_highlight_all=1
syntax on
"""""nerdtree end  """"
set number
set tabstop=4
set shiftwidth=4
set showmatch
set mouse=a
"set hlsearch 				"高亮不好用
set incsearch 				" 搜索时自动跟进


""""""分割窗口跳转的快捷键设置
" 组合快捷键：
nnoremap <C-J> <C-W><C-J>    " 组合快捷键：- Ctrl-j 切换到下方的分割窗口
nnoremap <C-K> <C-W><C-K>    " 组合快捷键：- Ctrl-k 切换到上方的分割窗口
nnoremap <C-L> <C-W><C-L>    " 组合快捷键：- Ctrl-l 切换到右侧的分割窗口
nnoremap <C-H> <C-W><C-H>    " 组合快捷键：- Ctrl-h 切换到左侧的分割窗口
""""""分割窗口跳转的快捷键设置

"""""""""""""""代码折叠""""""
set foldclose=all	"关闭自动折叠
set foldmethod=manual                " 手动开启折叠
"set foldlevel=99
" 使用空格键会是更好的选择,所以在你的配置文件中加上这一行命令吧：
" nnoremap <space> za
" 希望看到折叠代码的文档字符串？
let g:SimpylFold_docstring_preview=1
autocmd!   BufNewFile,BufRead *    setlocal nofoldenable
"""""""""""""""代码折叠""""""

""""""""""""'indentLine
" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
let g:indentLine_char='┆'

let g:indentLine_enabled = 1
"
""""高亮缩进
"let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239


"""""encoding
set encoding=utf-8


au BufNewFile,BufRead *.py
\ set tabstop=4		|
\ set softtabstop=4	|
\ set shiftwidth=4	|
"\ set textwidth=79	|
\ set expandtab		|
\ set autoindent	|
\ set fileformat=unix


""""""""""""""""""""""""""""""""""YCM"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""YCM"""""""""""""""""""""""""""""""""""""""""""""""""
" 补全菜单的开启与关闭
set completeopt=longest,menu                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_min_num_of_chars_for_completion=2             " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_autoclose_preview_window_after_completion=1       " 智能关闭自动补全窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口

" 补全菜单中各项之间进行切换和选取：默认使用tab  s-tab进行上下切换，使用空格选取。可进行自定义设置：
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']      " 通过上下键在补全菜单中进行切换
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    " 回车即选中补全菜单中的当前项

" 开启各种补全引擎
let g:ycm_collect_identifiers_from_tags_files=1         " 开启 YCM 基于标签引擎
let g:ycm_auto_trigger = 1                  " 开启 YCM 基于标识符补全，默认为1
let g:ycm_seed_identifiers_with_syntax=1                " 开启 YCM 基于语法关键字补全
let g:ycm_complete_in_comments = 1              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 注释和字符串中的文字也会被收入补全

" 重映射快捷键
"上下左右键的行为 会显示其他信息,inoremap由i 插入模式和noremap不重映射组成，只映射一层，不会映射到映射的映射
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>           " force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>

let g:ycm_key_list_stop_completion = ['<CR>']

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
nnoremap <leader>jr :YcmCompleter GoToReferences<CR> " 跳转到定义处
" let g:ycm_confirm_extra_conf=0                  " 关闭加载.ycm_extra_conf.py确认提示
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'


""""""""""""""""""""""""""""""""""YCM"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""YCM"""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin syntastic settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
" Use pylint to check python files.
let g:syntastic_python_checkers = ['pylint']
" map <F4> :SyntasticToggleMode<CR> :SyntasticCheck<CR>


"""""""YCM FOR PYTHON VIRTUAL ENVIROMENT
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py' 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" flake8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:flake8_quickfix_height=10


let python_highlight_all=1

""""""""""""""""""""ctrlsf, 文件夹搜索"""""""""""""""""""""
" nmap     <C-F>n <Plug>CtrlSFCwordPath
" nmap n <Plug>CtrlSFCwordPath
" Control + W 搜索当前单词
" nmap <C-W> <Plug>CtrlSFCwordPath 
" Control + N 搜索
" nmap <C-N> <Plug>CtrlSFPrompt
nmap <C-N> <Plug>CtrlSFCwordPath

""""""disable matchpairs
" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:FuckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FuckThatMatchParen()
augroup END

"""""""""""""""""""python-mode"""""""""""""""
" let g:pymode_python = 'python3'

""""文件跳转
" *********************************************
" ctrlp
" *********************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'
let g:ctrlp_by_filename = 1

""""文件内搜索
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

""""配色方案
"Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [ ['brown', 'RoyalBlue3'], ['Darkblue', 'SeaGreen3'], ['darkgray', 'DarkOrchid3'], ['darkgreen', 'firebrick3'],['darkcyan', 'RoyalBlue3'],['darkred', 'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['brown', 'firebrick3'],['gray', 'RoyalBlue3'],['black',       'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['Darkblue',  'firebrick3'],['darkgreen', 'RoyalBlue3'],['darkcyan', 'SeaGreen3'],['darkred', 'DarkOrchid3'],['red', 'firebrick3']]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""""""""""""""""""airline
let g:airline_powerline_fonts = 1
" 是否启用顶部tabline
let g:airline#extensions#tabline#enabled = 1
" 顶部tabline显示方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""""""""""""""""python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

""""""""""""""""tagbar
map <F4> :TagbarToggle<CR>

""""for LaTeX
"filetype plugin on
"set grepprg=grep\ -nH\ $*
"filetype indent on
"let g:tex_flavor='latex'
"autocmd filetype tex imap ∫ Tex_MathBF
"autocmd filetype tex imap ç Tex_MathCal
"autocmd filetype tex imap ¬ Tex_LeftRight
"autocmd filetype tex imap ˆ Tex_InsertItemOnThisLine
let g:Tex_GotoError = 0
let g:Tex_ShowErrorContext = 0
"-----------------latex live preview-------------------------
"autocmd filetype tex setl updatetime=1000
"autocmd Filetype tex setl updatetime=1
"let g:livepreview_previewer = 'open -a Skim'
"let g:livepreview_previewer = 'open -a Preview'
"let g:livepreview_previewer = 'open -a texshop'
