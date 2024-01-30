return {
  ensure_installed = {},
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup {}
    end,
    ["arduino_language_server"] = function()
      require("lspconfig")["arduino_language_server"].setup {
        cmd = {
          "arduino-language-server",
          "-cli-config",
          "/Users/yongle/Library/Arduino15/arduino-cli.yaml",
        },
      }
    end,
    ["tsserver"] = function ()
      require("typescript-tools").setup{}
    end
  },
}
