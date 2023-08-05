lua require("dapui").setup();
lua library = { plugins = { "nvim-dap-ui" }, types = true };
" lua require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true },});
lua local dap = require('dap');
            \ dap.adapters.lldb = {
            \     type = 'executable',
            \     command = '/usr/local/Cellar/llvm/16.0.6/bin/lldb-vscode',
            \     name = 'lldb'
            \ };
            \ dap.configurations.cpp = {
            \     {
            \         name = 'Launch',
            \         type = 'lldb',
            \         request = 'launch',
            \         program = function()
            \         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            \         end,
            \         cwd = '${workspaceFolder}',
            \         stopOnEntry = false,
            \         args = {},
            \     },
            \ };
            \ dap.configurations.rust = dap.configurations.cpp;
            \ dap.configurations.c = dap.configurations.cpp;
            \ dap.set_log_level('TRACE');

nnoremap <F7> :lua require('dap').continue()<CR>
nnoremap <F8> :lua require('dap').toggle_breakpoint()<CR>
nnoremap <F9> :lua require'dap'.step_over()<CR>
nnoremap <F10> :lua require('dap').step_into()<CR>
nnoremap <F11> :lua require('dap').step_out()<CR>
nnoremap <leader>dvh :lua require('dap.ui').variables.hover()<CR>
vnoremap <leader>dvh :lua require('dap.ui').variables.visual_hover()<CR>
nnoremap <leader>d? :lua  require('dap.ui').variables.scopes()<CR>
" nnoremap <leader>dct :lua require('dap').continue()<CR>
" nnoremap <leader>dtb :lua require('dap').toggle_breakpoint()<CR>
" nnoremap <leader>dsi :lua require('dap').step_into()<CR>
" nnoremap <leader>dso :lua require('dap').step_out()<CR>
nnoremap <leader>ddn :lua require('dap').down()<CR>
nnoremap <leader>dro :lua require('dap').repl.open({}, 'vsplit')<CR>" <C-w>l"
nnoremap <leader>dsb :lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <leader>dst :lua require('dap').stop()<CR>
nnoremap <leader>dup :lua require('dap').up()<CR>

" sign define DapBreakpoint text=🛑 texthl='' linehl='' numhl=''

" nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>
" nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
" nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
" nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>
" nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
" nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
