return {
    "ravitemer/mcphub.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
    config = function()
        require("mcphub").setup({
          extensios = {
            copilotchat = {
              enabled = true,
              convert_tools_to_functions = true,
              convert_resources_to_functions = true,
              add_mpc_prefix = false,
            }
          }
        })
    end
}
