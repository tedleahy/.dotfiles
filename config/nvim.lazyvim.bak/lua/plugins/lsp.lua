return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    servers = {
      solargraph = {},
      tsserver = {},
      perlnavigator = {
        cmd = { "perlnavigator" },
        settings = {
          perlnavigator = {
            perlPath = "perl",
            includePaths = { "/Users/tleahy/projects/messagefocus/local/lib/perl5" },
            enableWarnings = true,
            perltidyProfile = "",
            perlcriticProfile = "",
            perlcriticEnabled = true,
          },
        },
      },
    },
  },
}
