local M = {}

local function createImgDirIfNotExist(baseDir)
    if baseDir ~= "" then
        if vim.fn.finddir("img",baseDir) == "" then
            os.execute("mkdir " .. baseDir .. "/img")
        end
        return baseDir .. "/img"
    end
end

M.takeScreenShot = function (fileName)
    if fileName == nil or fileName == "" then
        fileName = vim.fn.strftime("Y%y_M%m_D%d_H%H_M%M")
    end
    local imgBaseDir = createImgDirIfNotExist(vim.fn.getcwd())
    if imgBaseDir ~= nil then
        local command = "flameshot gui --path " ..imgBaseDir .. "/" ..fileName
        os.execute(command)
        return './img/' .. fileName .. ".png"
    end
end

M.latexTakeShotAndSave = function()
    local option = {
        prompt = "Image Name:",
    }
    local lineNum = vim.fn.line(".")
    vim.ui.input(option,function (input)
        local fileName = string.gsub(input,"%s+","_")
        if fileName ~= "" and fileName ~= nil then
            local imgPath = M.takeScreenShot(fileName)
            local graph = {
                "\\end{figure}",
                "\t\\includegraphics[width=1.0\\textwidth]{" .. imgPath .. "}",
                "\\begin{figure}",
            }
            for i, line in ipairs(graph) do
                vim.fn.append(lineNum,line)
            end
        end
    end)
end

M.markdownTakeShotAndSave = function ()
    local option = {
        prompt = "Image Name:",
    }
    local lineNum = vim.fn.line(".")
    vim.ui.input(option,function (input)
        local fileName = string.gsub(input,"%s+","_")
        if fileName ~= "" and fileName ~= nil then
            local imgPath = M.takeScreenShot(fileName)
            vim.fn.append(lineNum,"!["..fileName.."]".."("..imgPath..")")
        end
    end)
end
return M
