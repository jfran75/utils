" Experimental
" let g:vimspector_base_dir=expand( '$HOME/.config/nvim/vimspector-config' )
let g:vimspector_enable_mappings='VISUAL_STUDIO'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
" autocmd FileType cs nmap <leader>dd :CocCommand vscode-mono-debug.vimspector.start<CR>
autocmd FileType cs nmap <leader>dd :CocCommand netcoredbg.vimspector.start<CR> 
