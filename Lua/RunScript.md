# RunScript

This function executes a Lua script from a file or string.

## Syntax

```lua
function RunScript(path: string): boolean
```

## Parameters

| Parameter | Description |
|-----|-----|
| path | script file to run |

## Returns

Returns true if the script was successfully run, otherwise false is returned.

## Remarks

This command can run both raw Lua code files (.lua) or compiled Lua byte code (.luac). See the [Lua documentation](https://www.lua.org/manual/5.4/luac.html) for additional information.

A build of the luac compiler is included in the "Tools" folder of the Ultra Engine install directory.

## Example

This shows a typical setup for the Lua side of a program.

```lua
function ExecuteDir(path)
    local dir = LoadDir(path)
    for i, file in ipairs(dir) do
        local filepath = path .. "/" .. file
        local fileType = FileType(filepath)
        if fileType == 1 and ExtractExt(file):Lower() == "lua" then
            RunScript(filepath)
        elseif fileType == 2 then
            ExecuteDir(filepath)
        end
    end
end

-- Get commandline settings
local settings = ParseCommandLine()

-- Run the error handler script
RunScript("Scripts/System/ErrorHandler.lua")

-- Enable the debugger if needed
local debugtimer
if settings["debug"] == true then
    RunScript("Scripts/System/Debugger.lua")
    debugtimer = CreateTimer(510)
    ListenEvent(EVENT_TIMERTICK, debugtimer, function() PollDebugger(500) end)
end

-- Enable the entity component system
RunScript("Scripts/System/ComponentSystem.lua")

-- Run user start scripts
ExecuteDir("Scripts/Start")

-- Run main script
RunScript("Scripts/Main.lua")
```