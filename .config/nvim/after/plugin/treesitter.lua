require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "c", "java", "cpp", "c_sharp", "python", "rust", "lua", "vim", "html" },


  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
