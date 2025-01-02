return {
  "robitx/gp.nvim",
  lazy = false,
  config = function()
    local conf = {
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1/chat/completions",
          secret = {
            "bash",
            "-c",
            "op item get 'OpenAI API Key' --field password",
          },
        },
        ollama = {
          endpoint = "http://localhost:11434/v1/chat/completions", -- Ollama default endpoint
          disable = false, -- Enable the provider
        },
      },
      agents = {
        {
          provider = "ollama", -- Use the Ollama provider
          name = "Qwen2.5:32B", -- A user-friendly name for the agent
          chat = false, -- Enable chat functionality
          command = true, -- Disable command functionality (optional)
          model = {
            model = "qwen2.5-coder:32b", -- Model name used with Ollama
            temperature = 0.2, -- Adjust as needed
            top_p = 1, -- Adjust as needed
          },
          system_prompt = "You are an AI assistant specialised in coding and programming tasks.", -- Custom system prompt
        },
      },

      default_chat_agent = "ChatGPT4o",
      default_command_agent = "Qwen2.5:32B", -- Set this as the default chat agent
      chat_confirm_delete = false,
    }
    require("gp").setup(conf)

    -- Configure which-key for gp.nvim
    local wk = require("which-key")
    wk.add({
      mode = { "n", "i", "v" }, -- Apply to Normal, Insert, and Visual modes
      nowait = true,
      remap = false,
      {
        -- { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
        -- { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
        -- { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
        { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
        { "<C-g>p", "<cmd>GpChatPaste<cr>", desc = "Selection into Chat" },
        { "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
        { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
        { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
        { "<C-g>g", group = "generate into new .." },
        { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
        { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
        { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
        { "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
        { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
        { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
        { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
        { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
        -- { "<C-g>w", group = "Whisper" },
        -- { "<C-g>wa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
        -- { "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
        -- { "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
        -- { "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
        -- { "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
        -- { "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
        -- { "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
        -- { "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
        -- { "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
        -- { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
      },
    })
  end,
}

-- return {
--   "robitx/gp.nvim",
--   config = function()
--     local conf = {
--       providers = {
--         openai = {
--           endpoint = "https://api.openai.com/v1/chat/completions",
--           secret = {
--             "bash",
--             "-c",
--             "op item get 'OpenAI API Key' --field password",
--           },
--           disable = true,
--         },
--         ollama = {
--           endpoint = "http://localhost:11434/v1/chat/completions",
--         },
--       },
--       agents = {
--         {
--           provider = "ollama",
--           name = "ChatOllamaLlama3.1-8B",
--           disable = true,
--         },
--         {
--           provider = "ollama",
--           name = "Qwen2.5:32GB",
--           chat = true,
--           command = false,
--           -- string with model name or table with model name and parameters
--           model = {
--             model = "qwen2.5-coder:32b",
--             temperature = 0.1,
--             top_p = 1,
--             min_p = 0.05,
--           },
--           -- system prompt (use this to specify the persona/role of the AI)
--           system_prompt = "You are a general AI assistant.",
--         },
--       },
--     }
--     require("gp").setup(conf)
--
--     -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
--   end,
-- }
