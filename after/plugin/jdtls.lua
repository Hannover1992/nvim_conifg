local config = {
     autostart = true,
    cmd = {'/home/uczen/.local/state/nvim/jdtls/bin/jdtls'},
    -- root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    root_dir = '/home/uczen/Uni/2Hor/Assignment_04/Auf1/',
}
require('jdtls').start_or_attach(config)