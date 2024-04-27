return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = function()
    local logo = {
      [[                                                                                                    ]],
      [[  +##############+                         :=+*###**+-:                         +##############+    ]],
      [[  #@@@@@@@@@@@@@@*                 .+%%@@@@@@@@@@@@@@@@@@@@%%+                  *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*             :#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%#:             *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*          +%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%=          *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*       -%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%:       *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*     +@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%+     *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*   +@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+   *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@* -@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%- *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@##@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@##@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                              :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                              :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                              :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                              :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                              :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                              :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                              :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                              :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*                                                              *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*                                                              *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*                                                              *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*                                                              *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*                                                              *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*                                                              *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*                                                              *@@@@@@@@@@@@@@#    ]],
      [[  #@@@@@@@@@@@@@@*                                                              *@@@@@@@@@@@@@@#    ]],
      [[                                                                                                      ]],
      [[  :@%@@@@+  @%       #@@@%@%                                     -@*               .@%                ]],
      [[  :@#      .@%       #@%  -@@@                                   -@*               .@%                ]],
      [[  :@#      .@%       #%%    @@  %@@@@@*   %@@@@:  .@@@@%@+       -@*      %@@@@@%  .@%%@%@@%   -@@@@% ]],
      [[  :@@@@%#  .@%       #%@@%@@@+       @@  #@#     -@#    +@%      -@*           %@  .@@-    %@. #@+    ]],
      [[  :@#      .@%       #@%--.    +@@%*#@@    %@@@= *@+     @@      -@*     :@@%#*@@  .@%     *@-  :%@@%.]],
      [[  :@%++++-  @%       #@%       %@*  :@@  %@+ .@#  %@#  =%@=      -@%+++= *@=  .%@: .@@%- .%@%  #%  =%*]],
      [[  :%%%%%%*  %%%-     #%%        -@@%.%%%  :%@%-     #@@%-        -%%%%%%  :%%%.*%% .%% *%@%     =%@%: ]],
      [[                                                                                                      ]],
    }


    local opts = {
      theme = "doom",
      config = {
        header = logo,
        center = {
          {
            icon = '󰏓 ',
            icon_hl = 'DashboardMruIcon',
            desc = ' Find File',
            desc_hl = 'String',
            key = 'f',
            key_hl = 'Number',
            key_format = ' %s',
            action = ':Telescope find_files'
          },
          {
            icon = ' ',
            icon_hl = 'DashboardMruIcon',
            desc = ' Recent files',
            desc_hl = 'String',
            key = 'o',
            key_hl = 'Number',
            key_format = ' %s',
            action = ':Telescope oldfiles'
          }
        },
        footer = {}
      }
    }

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
