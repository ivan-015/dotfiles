return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim'
  },
  config = function()
    -- local adapters = require("ivan.plugins.dap.adapters")
    -- local configs = require("ivan.plugins.dap.configurations")
    local dap, dapui = require('dap'), require('dapui')
    local mason, mason_dap = require('mason'), require('mason-nvim-dap')

    -- Ensure deps are set up
    mason.setup()
    mason_dap.setup({
      ensure_installed = { 'node2@v1.43.0', 'js@v1.77.0' },
      automatic_installation = true
    })

    dapui.setup()

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
