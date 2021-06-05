" CUSTOM HEADER
"let g:startify_custom_header = [
"            \ '           ,.,                               ',
"            \ '          MMMM_    ,..,                      ',
"            \ '             "_ "__"MMMMM          ,...,,    ',
"            \ '     ,..., __." --"    ,.,     _-"MMMMMMM    ',
"            \ '    MMMMMM"___ "_._   MMM"_."" _ """"""      ',
"            \ '     """""    "" , \_.   "_. ."              ',
"            \ '            ,., _"__ \__./ ."                ',
"            \ '           MMMMM_"  "_    ./                 ',
"            \ '            ''''      (    )                 ',
"            \ '     ._______________."____"---._.           ',
"            \ '      \                          /           ',
"            \ '       \________________________/            ',
"            \ '       (_)                    (_)            ',
"            \ ]

" MENU
"          \ { 'type': 'files',     'header': ['   Files']            },
let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
" BOOKMARKS
let g:startify_bookmarks = [
            \ { 'd': '~/Documents/latex' },
            \ { 'n': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.config/zsh/.zshrc' },
            \ ]
" AUTOLOAD SESSIONS
" If this option is enabled and you start Vim in a directory that contains a Session.vim,
" that session will be loaded automatically. Otherwise it will be shown as the top entry
" in the Startify buffer.
let g:startify_session_autoload = 1
" SESSION DIRECTORY
let g:startify_session_dir = '~/.config/nvim/session'
" SPECIFY SHOWN DIRECTORY
" If this option is enabled the directory shown will always be the directory
" with the project file in it.
let g:startify_change_to_vcs_root = 1
" AUTOMATICALLY UPDATE SESSIONS
let g:startify_session_persistence = 1
" PERMISSION TO TAKE CARE OF BUFFERS
let g:startify_session_delete_buffers = 1
" GET RID OF EMPTY BUFFERS ON QUIT
let g:startify_enable_special = 0
" POSSIBLE COMMANDS
" :SLoad       load a session
" :SSave[!]    save a session
" :SDelete[!]  delete a session
" :SClose      close a session

                                
