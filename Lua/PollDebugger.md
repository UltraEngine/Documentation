# PollDebugger

This function periodically polls the script debugger to check for user actions.

## Syntax

```lua
function PollDebugger(frequency)
```

### Parameters

- `frequency` (optional): maximum frequency of the action, in milliseconds

## Remarks

For script debugging to work, the debugger must be enabled by running "Scripts/Modules/Debugger.lua".

If you don't periodically call this function, your application will not detect new breakpoints as they are set in the IDE.

## Example

This shows a typical setup for the Lua side of a Lua program.

```lua
function main(argc, argv)
    -- Get command-line options
    local cl = ParseCommandLine(argc, argv)

    -- Enable script debugging if the -debug switch is specified
    if cl["debug"] == true then
        RunScript("Scripts/Modules/Debugger.lua")
    end

    -- Create a timer
    local timer = CreateTimer(490)

    -- Poll the debugger every timer tick
    ListenEvent(EVENT_TIMERTICK, timer, function() PollDebugger(500) end)

    -- Run the main script
    RunScript("Scripts/Main.lua")

    return 0
end

main(...)
```