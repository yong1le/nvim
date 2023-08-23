-- The starting place for configuration
return {

  -- Packages related to the core editing experience. This includes syntax
  -- highlighting, motions, text objects, fzf
  { import = "base.core" },

  -- Packages related to UI. This includes icons, trees, tab/winbars and other
  -- visual elements
  { import = "base.ui" },

  -- Packages related to git
  { import = "base.git"},

  -- Packages needed to setup lsp
  -- { import = "base.lsp" },

  -- Individual lsp configurations for each language
  -- { import = "base.lang" },
}
