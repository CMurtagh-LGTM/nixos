pkgs: with pkgs.vimPlugins; {
    plugin = bufferline-nvim;
    config = ''
lua << EOF
local bufferline = require"bufferline"
local function safe_delete_buffer(num)
    xpcall(
        vim.cmd,
        function(err)
            print(err)
        end,
        string.format("bdelete %d", num)
    )
end
bufferline.setup {
  options = {
    numbers = "none",
    tab_size = 7,
    show_close_icon = false,
    close_command = safe_delete_buffer,
    right_mouse_command = safe_delete_buffer,
  }
}

require"which-key".register{
    ["<leader>"] = {
        ["}"] = {"<cmd>BufferLineCycleNext<cr>", "Next buffer"},
        ["{"] = {"<cmd>BufferLineCyclePrev<cr>", "Prev buffer"},
        b = {"<cmd>BufferLinePick<cr>", "Pick buffer to swap to"},
        d = {"<cmd>BufferLinePickClose<cr>", "Pick buffer to close"},
    }
}
EOF
    '';
}
