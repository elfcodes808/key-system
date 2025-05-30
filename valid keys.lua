local validKeys = {
    "Key123",
} -- Add more valid keys as needed

local function isValidKey(inputKey)
    for _, key in ipairs(validKeys) do
        if key == inputKey then
            return true
        end
    end
    return false
end

local function getgenv()
    return _G
end

local function loadProtectedScript()
    if not getgenv().key then
        error("No key provided! Set getgenv().key before executing the script.")
    end

    if not isValidKey(getgenv().key) then
        error("Invalid key! Access denied.")
    end

    -- The actual script to execute
    return [[
        print("Key is valid! Executing script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/elfcodes808/scripty/refs/heads/main/printsys.lua"))()
    ]]
end

return loadProtectedScript
