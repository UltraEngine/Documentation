# GetStat

Namespace: [Steamworks](Steamworks.md)

This function gets a statistic for the user for this game.

## Syntax

- number **GetStat**([string]([WString.md](https://www.lua.org/manual/5.4/manual.html#6.4)) name)

## Returns

Returns the statistic value, or -1 if the value cannot be retrieved.

## Example

```lua
-- Initialize Steamworks
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return 1
end

-- Increment the stat
Steamworks.AddStat("NumWins")

-- Retrieve the current value
local value = Steamworks.GetStat("NumWins")
Print(value)

-- Shutdown Steamworks
Steamworks.Shutdown()
```
