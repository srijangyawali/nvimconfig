require "user.autocmd"
require "user.keymaps"
require "user.launch"
require "user.options"
require "user.extras.competitiveProgramming"

spec "user.colorscheme.material"
spec "user.colorscheme.rose-pine"
spec "user.colorscheme.onedark"

-- core plugins
spec "user.autopairs"
spec "user.colorizer"
spec "user.comment"
spec "user.gitsigns"
spec "user.indentline"
spec "user.lualine"
spec "user.mason"
spec "user.neotab"
spec "user.nvimtree"
spec "user.telescope"
spec "user.toggleterm"
spec "user.treeSitter"
spec "user.whichkey"
-- install neogit for better git integrations
-- install gitlinker for git blame and other options
-- skipped schemestore
-- also needs jsonls additional settings for schemastores to setup
-- learn about quick fix and go for better quick fix (bqf)

-- debugger extensions
spec "user.debug.dap-ui"
spec "user.debug.dap"
spec "user.debug.mason-nvimdap"

-- extra extensions 
spec "user.extras.alpha"
spec "user.extras.breadcrumps"
spec "user.extras.devIcons"
spec "user.extras.dressing"
spec "user.extras.fidget"
spec "user.extras.harpoon"
spec "user.extras.illuminate"
-- spec "user.lab"
spec "user.extras.modicator"
spec "user.extras.navic"
-- get real tabs using tabby
-- get neo test for using nvim on tests
spec "user.extras.neoscroll"
spec "user.extras.noice"
spec "user.extras.todoComments"
spec "user.extras.ufo"

-- lspsetting plugins
spec "user.lspsettings.cmp"
spec "user.lspsettings.lspconfig"
spec "user.lspsettings.none-ls"
-- spec "user.lspsettings.tabnine"

-- this has to be at the end
require "user.lazy"

