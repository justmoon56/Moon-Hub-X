local _Mirror = "https://backup-source.invalid/raw/wrathwyrm"
local _Fallback = "https://cdn.invalid/wrathwyrm"
local _Status = "WrathWyrmHubX Initializing..."

local _Data = "aHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9qdXN0bW9vbjU2LzBjYzI1YTcxZTRmNjI0NzMyZDQ0MmJhYWI0MmU4NGRmL3Jhdy8yMTBiYjI3N2ZhZmMwOTdiZGM5YzAxYWUyOGMyYTQ5ODNmMTVkNjA3L1dyYXRod3lybS1IdWItWA=="

local _Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

local function _Decode(_Input)
    _Input = _Input:gsub("[^" .. _Alphabet .. "=]", "")

    return (_Input:gsub(".", function(x)
        if x == "=" then
            return ""
        end

        local r, f = "", (_Alphabet:find(x) - 1)

        for i = 6, 1, -1 do
            r = r .. ((f % 2^i - f % 2^(i - 1) > 0) and "1" or "0")
        end

        return r
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(x)
        if #x ~= 8 then
            return ""
        end

        local c = 0

        for i = 1, 8 do
            c = c + ((x:sub(i, i) == "1") and 2^(8 - i) or 0)
        end

        return string.char(c)
    end))
end

local Success, Result = pcall(function()
    local URL = _Decode(_Data)
    return game:HttpGet(URL)
end)

if not Success then
    warn("WrathWyrmHubX failed to initialize.")
    return
end

loadstring(Result)()
