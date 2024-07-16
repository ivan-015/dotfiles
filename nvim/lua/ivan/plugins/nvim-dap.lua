return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'theHamsta/nvim-dap-virtual-text',
    'mxsdev/nvim-dap-vscode-js',
    'nvim-telescope/telescope-dap.nvim',
    {
      'microsoft/vscode-js-debug',
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    }
  },
  config = function()
    local telescope = require('telescope')
    telescope.load_extension('dap')
    -- Set up dap vscode
    local dapvsc = require('dap-vscode-js')
    dapvsc.setup({
      debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',                                                       -- Path to vscode-js-debug installation.
      adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
    })

    for _, language in ipairs({ "typescript", "javascript" }) do
      require("dap").configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch",
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
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Docker",
          address = "localhost",
          port = 9229,
          localRoot = "${workspaceFolder}",
          remoteRoot = "/usr/src/app",
          skipFiles = { "<node_internals>/**" },
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require('dap.utils').pick_process,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          console = "integratedTerminal",
        }
      }
    end

    local dap, dapui = require('dap'), require('dapui')
    local mason, mason_dap = require('mason'), require('mason-nvim-dap')
    local dap_virtual_text = require('nvim-dap-virtual-text')

    -- Ensure deps are set up
    mason.setup()
    mason_dap.setup({
      ensure_installed = { 'node2@v1.43.0', 'js@v1.77.0' },
      automatic_installation = true
    })

    dapui.setup()
    dap_virtual_text.setup()
    --
    -- dap-ui setup
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- UI Setup
    vim.fn.sign_define('DapBreakpoint', { text = '👾' })

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
    vim.keymap.set('n', '<leader>do', dap.step_over, {})
    vim.keymap.set('n', '<leader>di', dap.step_into, {})
    vim.keymap.set('n', '<leader>dt', dap.step_out, {})
    vim.keymap.set('n', '<leader>de', function()
      dap.disconnect({ terminateDebuggee = true })
      dap.terminate({}, { terminateDebuggee = true }, function()
        vim.cmd.bd()
      end)
    end)
  end
}
