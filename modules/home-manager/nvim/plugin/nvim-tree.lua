       -- function to set keymaps for nvim-tree while closed

       vim.keymap.set("n", "<Tab>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer

       local function my_on_attach(bufnr)
           local api = require('nvim-tree.api')
           local function opts(desc)
               return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
           end
           -- set keymaps for nvim-tree while open
           vim.keymap.set('n', '<BS>',    api.tree.change_root_to_node,        opts('CD'))
           vim.keymap.set('n', 'i',       api.node.show_info_popup,            opts('Info'))
           vim.keymap.set('n', '<C-v>',   api.node.open.vertical,              opts('Open: Vertical Split'))
           vim.keymap.set('n', '<C-x>',   api.node.open.horizontal,            opts('Open: Horizontal Split'))
           vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
           vim.keymap.set('n', 'P',       api.node.open.preview,               opts('Open Preview'))
           vim.keymap.set('n', '.',       api.node.run.cmd,                    opts('Run Command'))
           vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
           vim.keymap.set('n', 'bd',      api.marks.bulk.delete,               opts('Delete Bookmarked'))
           vim.keymap.set('n', 'bm',      api.marks.bulk.move,                 opts('Move Bookmarked'))
           vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
           vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
           vim.keymap.set('n', '?',       api.tree.toggle_help,                opts('Help'))
           vim.keymap.set('n', 'g',       api.fs.copy.absolute_path,           opts('Copy Absolute Path'))
           vim.keymap.set('n', 'm',       api.marks.toggle,                    opts('Toggle Bookmark'))
           vim.keymap.set('n', 'o',       api.node.open.edit,                  opts('Open'))
           vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
           vim.keymap.set('n', 'r',       api.fs.rename,                       opts('Rename'))
           vim.keymap.set('n', 'R',       api.tree.reload,                     opts('Refresh'))
           vim.keymap.set('n', 'W',       api.tree.collapse_all,               opts('Collapse'))
           vim.keymap.set('n', 'x',       api.fs.cut,                          opts('Cut'))
           vim.keymap.set('n', 'y',       api.fs.copy.filename,                opts('Copy Name'))
           vim.keymap.set('n', 'Y',       api.fs.copy.relative_path,           opts('Copy Relative Path'))

       end
       -- recommended settings from nvim-tree documentation
       vim.g.loaded_netrw = 1
       vim.g.loaded_netrwPlugin = 1

       -- change color for arrows in tree to light blue
       vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
       vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

       require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
           on_attach = my_on_attach,
           hijack_cursor = false,
           auto_reload_on_write = true,
           disable_netrw = false,
           hijack_netrw = true,
           hijack_unnamed_buffer_when_opening = false,
           root_dirs = {},
           prefer_startup_root = false,
           sync_root_with_cwd = false,
           reload_on_bufenter = false,
           respect_buf_cwd = false,
           select_prompts = false,
           sort = {
               sorter = "name",
               folders_first = true,
               files_first = false,
           },
           view = {
               centralize_selection = false,
               cursorline = true,
               debounce_delay = 15,
               side = "left",
               preserve_window_proportions = false,
               number = false,
               relativenumber = false,
               signcolumn = "yes",
               width = 30,
               float = {
                   enable = false,
                   quit_on_focus_loss = true,
                   open_win_config = {
                       relative = "editor",
                       border = "rounded",
                       width = 30,
                       height = 30,
                       row = 1,
                       col = 1,
                   },
               },
           },
           renderer = {
               add_trailing = false,
               group_empty = false,
               full_name = false,
               root_folder_label = ":~:s?$?/..?",
               indent_width = 2,
               special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
               symlink_destination = true,
               highlight_git = "none",
               highlight_diagnostics = "none",
               highlight_opened_files = "none",
               highlight_modified = "none",
               highlight_bookmarks = "none",
               highlight_clipboard = "name",
               indent_markers = {
                   enable = false,
                   inline_arrows = true,
                   icons = {
                       corner = "└",
                       edge = "│",
                       item = "│",
                       bottom = "─",
                       none = " ",
                   },
               },
               icons = {
                   web_devicons = {
                       file = {
                           enable = true,
                           color = true,
                       },
                       folder = {
                           enable = false,
                           color = true,
                       },
                   },
                   git_placement = "before",
                   modified_placement = "after",
                   diagnostics_placement = "signcolumn",
                   bookmarks_placement = "signcolumn",
                   padding = " ",
                   symlink_arrow = " ➛ ",
                   show = {
                       file = true,
                       folder = true,
                       folder_arrow = true,
                       git = true,
                       modified = true,
                       diagnostics = true,
                       bookmarks = true,
                   },
                   glyphs = {
                       default = "",
                       symlink = "",
                       bookmark = "󰆤",
                       modified = "●",
                       folder = {
                           arrow_closed = "",
                           arrow_open = "",
                           default = "",
                           open = "",
                           empty = "",
                           empty_open = "",
                           symlink = "",
                           symlink_open = "",
                       },
                       git = {
                           unstaged = "✗",
                           staged = "✓",
                           unmerged = "",
                           renamed = "➜",
                           untracked = "★",
                           deleted = "",
                           ignored = "◌",
                       },
                   },
               },
           },
           hijack_directories = {
               enable = true,
               auto_open = true,
           },
           update_focused_file = {
               enable = false,
               update_root = false,
               ignore_list = {},
           },
           system_open = {
               cmd = "",
               args = {},
           },
           git = {
               enable = true,
               show_on_dirs = true,
               show_on_open_dirs = true,
               disable_for_dirs = {},
               timeout = 400,
               cygwin_support = false,
           },
           diagnostics = {
               enable = true,
               show_on_dirs = false,
               show_on_open_dirs = true,
               debounce_delay = 50,
               severity = {
                   min = vim.diagnostic.severity.HINT,
                   max = vim.diagnostic.severity.ERROR,
               },
               icons = {
                   hint = "",
                   info = "",
                   warning = "",
                   error = "",
               },
           },
           modified = {
               enable = false,
               show_on_dirs = true,
               show_on_open_dirs = true,
           },
           filters = {
               git_ignored = false,
               dotfiles = false,
               git_clean = false,
               no_buffer = false,
               no_bookmark = false,
               custom = {},
               exclude = {},
           },
           live_filter = {
               prefix = "[FILTER]: ",
               always_show_folders = true,
           },
           filesystem_watchers = {
               enable = true,
               debounce_delay = 50,
               ignore_dirs = {},
           },
           actions = {
               use_system_clipboard = true,
               change_dir = {
                   enable = true,
                   global = false,
                   restrict_above_cwd = false,
               },
               expand_all = {
                   max_folder_discovery = 300,
                   exclude = {},
               },
               file_popup = {
                   open_win_config = {
                       col = 1,
                       row = 1,
                       relative = "cursor",
                       border = "shadow",
                       style = "minimal",
                   },
               },
               open_file = {
                   quit_on_open = true,
                   eject = true,
                   resize_window = true,
                   window_picker = {
                       enable = true,
                       picker = "default",
                       chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                       exclude = {
                           filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                           buftype = { "nofile", "terminal", "help" },
                       },
                   },
               },
               remove_file = {
                   close_window = true,
               },
           },
           trash = {
               cmd = "gio trash",
           },
           tab = {
               sync = {
                   open = false,
                   close = false,
                   ignore = {},
               },
           },
           notify = {
               threshold = vim.log.levels.INFO,
               absolute_path = true,
           },
           help = {
               sort_by = "key",
           },
           ui = {
               confirm = {
                   remove = true,
                   trash = true,
                   default_yes = false,
               },
           },
           experimental = {},
           log = {
               enable = false,
               truncate = false,
               types = {
                   all = false,
                   config = false,
                   copy_paste = false,
                   dev = false,
                   diagnostics = false,
                   git = false,
                   profile = false,
                   watcher = false,
               },
           },
       } -- END_DEFAULT_OPTS      
