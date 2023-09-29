" Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" OmniSharp
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths = [ 'Temp[/\\]', 'obj[/\\]', '\.nuget[/\\]' ]
let g:OmniSharp_fzf_options = { 'down': '10' }

augroup csharp_commands
    autocmd!
    " autocmd FileType cs nmap <buffer> <C-S-Bar> <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <buffer> <F12> <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <buffer> <Bslash>a <Plug>(omnisharp_code_actions)
    autocmd FileType cs xmap <buffer> <Bslash>a <Plug>(omnisharp_code_actions)
    autocmd FileType cs nmap <buffer> <Bslash>r <Plug>(omnisharp_rename)
    autocmd FileType cs nmap <buffer> <Leader>cf <Plug>(omnisharp_code_format)
    autocmd FileType cs nmap <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <buffer> <Leader>dc <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <buffer> <Leader>cc <Plug>(omnisharp_global_code_check)
    autocmd FileType cs nmap <buffer> <Leader>rt <Plug>(omnisharp_run_test)
    autocmd FileType cs nmap <buffer> <Leader>rT <Plug>(omnisharp_run_tests_in_file)
    autocmd FileType cs nmap <buffer> <Leader>ss <Plug>(omnisharp_start_server)
    autocmd FileType cs nmap <buffer> <Leader>sp <Plug>(omnisharp_stop_server)
    autocmd FileType cs nmap <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd FileType cs imap <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd BufWritePre *.cs :OmniSharpCodeFormat

    " vim-better-whitespace
    autocmd FileType cs let g:strip_whitespace_on_save = 1
    autocmd FileType cs let g:strip_whitespace_confirm = 0
augroup ENDe
