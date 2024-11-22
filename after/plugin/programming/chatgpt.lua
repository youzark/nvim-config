local config = {
    chat_shortcut_respond = { modes = { "n", "v", "x" }, shortcut = "<CR>" },
    chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<A-d>" },
    chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<A-s>" },
    chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<A-n>" },
    chat_free_cursor = true,
	agents = {
		{
			name = "ChatGPT4o",
			chat = true,
			command = false,
			-- string with model name or table with model name and parameters
			model = {
                model = "gpt-4o", temperature = 0, top_p = 0.95 },
                -- system prompt (use this to specify the persona/role of the AI)
                system_prompt = "You are a general AI assistant.\n\n"
                    .. "The user provided the additional info about how they would like you to respond:\n\n"
                    .. "- If you're unsure don't guess and say you don't know instead.\n"
                    .. "- Ask question if you need clarification to provide better answer.\n"
                    .. "- Think deeply and carefully from first principles step by step.\n"
                    .. "- Zoom out first to see the big picture and then zoom in to details.\n"
                    .. "- Use Socratic method to improve your thinking and coding skills.\n"
                    .. "- Don't elide any code from your output if the answer requires coding.\n"
                    .. "- Take a deep breath; You've got this!\n",
		},
		{
			name = "Translator",
			chat = true,
			command = false,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
            system_prompt = [[ 
                你是一位精通简体中文的专业翻译，尤其擅长翻译人工智能领域的专业论文。请你帮我将以下英文段落翻译成中文，风格与中文人工智能研究论文相似。请将公式以latex格式展示。
                规则：
                – 翻译时要准确传达原文的事实和背景。
                – 即使上意译也要保留原始段落格式，以及保留术语，例如 FLAC，JPEG 等。保留公司缩写，例如 Microsoft, Amazon, OpenAI 等。
                – 人名不翻译
                – 同时要保留引用的论文，例如 [20] 这样的引用。
                – 对于 Figure 和 Table，翻译的同时保留原有格式，例如：“Figure 1: ”翻译为“图 1: ”，“Table 1: ”翻译为：“表 1: ”。
                – 全角括号换成半角括号，并在左括号前面加半角空格，右括号后面加半角空格。
            ]]
		},
		{
			name = "CodeGPT4",
			chat = false,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are an AI working as a code editor.\n\n"
				.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
				.. "START AND END YOUR ANSWER WITH:\n\n```",
		},
	},

}

local set_keymap = function()
    local function keymapOptions(desc)
        return {
            noremap = true,
            silent = true,
            nowait = true,
            desc = "GPT prompt " .. desc,
        }
    end

    -- Chat commands
    vim.keymap.set({"n"}, "<leader>cc", "<cmd>GpChatToggle popup<cr>", keymapOptions("Toggle Chat"))

    vim.keymap.set({"n"}, "<leader>cn", "<cmd>GpChatNew popup<cr>", keymapOptions("New Chat"))
    vim.keymap.set("v", "<leader>cn", ":<C-u>'<,'>GpChatNew popup<cr>", keymapOptions("Visual Chat New"))
    vim.keymap.set({"n"}, "<leader>cf", "<cmd>GpChatFinder popup<cr>", keymapOptions("Chat Finder"))

    vim.keymap.set("v", "<leader>cc", ":<C-u>'<,'>GpChatPaste popup<cr>", keymapOptions("Visual Chat Paste"))
    -- vim.keymap.set("v", "<leader>cp", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))

    vim.keymap.set({ "n", "i" }, "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", keymapOptions("New Chat tabnew"))

    vim.keymap.set("v", "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))

    -- Prompt commands

    vim.keymap.set({"n", "i", "v", "x"}, "<A-s>", "<cmd>GpStop<cr>", keymapOptions("Stop"))

    -- optional Whisper commands with prefix <C-g>w
    vim.keymap.set({"n", "i"}, "<leader>cw", "<cmd>GpWhisper<cr>", keymapOptions("Whisper"))
end

set_keymap()
require("gp").setup(config)
