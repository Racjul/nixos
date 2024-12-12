
require("luasnip").config.set_config {
    store_selection_keys = "<Tab>",
    -- Don't store snippet history for less overhead
    history = false,
    -- Allow autotrigger snippets
    enable_autosnippets = true,
    -- Event on which to check for exiting a snippet's region
    region_check_events = 'InsertEnter',
    delete_check_events = 'InsertLeave',
}
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})
