return {
  'microsoft/vscode-js-debug',
  config = function()
    for _, language in ipairs({ "typescript", "javascript" }) do
      require("dap").configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "TypeScript",
          cwd = "${workspaceFolder}",
          args = {
            "${workspaceFolder}/src/main.ts"
          },
          runtimeArgs = {
            "--nolazy",
            "-r",
            "ts-node/register",
            "-r",
            "tsconfig-paths/register"
          },
          sourceMaps = true,
        },
      }
    end
  end,
  build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
}
