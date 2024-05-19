lua require('dap-go').setup {
            \ dap_configurations = {
            \     {
            \         type = "go",
            \         name = "Attach remote",
            \         mode = "remote",
            \         request = "attach",
            \     },
            \ },
            \ delve = {
            \     {
            \         path = "/Users/shsheep/go/bin/dlv",
            \         initialize_timeout_sec = 10,
            \         port = "${port}",
            \         args = {},
            \         build_flags = "",
            \     },
            \ }
            \ };
