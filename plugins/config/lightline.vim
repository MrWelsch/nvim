" let s:colors = OneDark#GetColors()
"{{{ LightLine configuration (bufline additions have different indentations)
  let g:lightline = { 'colorscheme': 'dracula_pro' }
  let g:lightline.component_expand = {
            \  'buffercurrent': 'lightline#buffer#buffercurrent',
            \  'bufferbefore': 'lightline#buffer#bufferbefore',
            \  'bufferafter': 'lightline#buffer#bufferafter',
            \ }
  let g:lightline.component_type = {
            \   'buffercurrent': 'tabsel',
            \   'bufferbefore': 'raw',
            \   'bufferafter': 'raw',
            \ }
  let g:lightline.active = {
  	\ 'left': [[ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ]],
    \ 'right': [[ 'lineinfo' ], [ 'percent' ], [ 'fileencoding', 'filetype' ]]
 	\ }
"  let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:palette.normal.left = [[ s:colors.white.gui, s:colors.visual_grey.gui, s:colors.white.cterm, s:colors.visual_grey.cterm ]]
"  let s:palette.normal.middle = s:palette.normal.left
"  let s:palette.normal.right = s:palette.normal.left
"  let s:palette.insert.left = [[ s:colors.black.gui, s:colors.blue.gui, s:colors.black.cterm, s:colors.blue.cterm ]]
"  let s:palette.insert.middle = s:palette.insert.left
"  let s:palette.insert.right = s:palette.insert.left
"  let s:palette.visual.left = [[ s:colors.black.gui, s:colors.yellow.gui, s:colors.black.cterm, s:colors.yellow.cterm]]
"  let s:palette.visual.middle = s:palette.visual.left
"  let s:palette.visual.right = s:palette.visual.left
  """ Following is for buffer list.
"  let s:palette.tabline.left   = s:palette.normal.left
"  let s:palette.tabline.tabsel = [ [ s:colors.black.gui, s:colors.white.gui, s:colors.black.cterm, s:colors.white.cterm ] ]
"  let s:palette.tabline.middle  = s:palette.tabline.left
"  let s:palette.tabline.right  = s:palette.tabline.left
  " use lightline-buffer in lightline
  let g:lightline.tabline = {
      \   'left': [ [ 'none' ],
      \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
      \   'right': [ [ 'none' ], ],
      \ }
  let g:lightline.component_function = {
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ }
  let g:lightline.component = {
      \   'separator': '|',
      \ }
  " lightline-buffer ui settings
  " replace these symbols with ascii characters if your environment does not support unicode
  let g:lightline_buffer_logo = ''
  let g:lightline_buffer_readonly_icon = ''
  let g:lightline_buffer_modified_icon = '✭'
  let g:lightline_buffer_git_icon = ' '
  let g:lightline_buffer_ellipsis_icon = '…'
  let g:lightline_buffer_expand_left_icon = '◀ '
  let g:lightline_buffer_expand_right_icon = ' ▶'
"}}}
