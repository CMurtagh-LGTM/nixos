pkgs: with pkgs.vimPlugins; {
    plugin = nvim-autopairs;
    config = ''
lua << EOF
_G.MUtils = {}
local npairs = require("nvim-autopairs") 
npairs.setup({
    check_ts = true,
    map_bs = false,
    disable_filetype = { "TelescopePrompt" , "vim", "rmd" },
})

local Rule = require('nvim-autopairs.rule')
npairs.add_rule(Rule("\\(","\\)","tex"))
npairs.add_rule(Rule("\\[","\\]","tex"))
npairs.add_rule(Rule("\\{","\\}","tex"))
npairs.add_rule(Rule("\\left(","\\right)","tex"))
npairs.add_rule(Rule("\\left[","\\right]","tex"))
npairs.add_rule(Rule("\\left{","\\right}","tex"))
npairs.add_rule(Rule("\\left.","\\right.","tex"))

-- Decide to do either coq or npairs keybinds

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
vim.api.nvim_set_keymap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
vim.api.nvim_set_keymap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })

EOF
    '';
}
