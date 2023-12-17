# SetStat

This function sets a user statitics value for this game.

## Syntax

- boolean **SetStat**([string](https://www.lua.org/manual/5.4/manual.html#6.4) key, [string](https://www.lua.org/manual/5.4/manual.html#6.4) value)

## Example

```lua
-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

-- Retrieve the current value
local value = Steamworks.GetStat("NumWins")
Print(value)

-- Set a new value
Steamworks.SetStat("NumWins", 105)

-- Shutdown Steam
Steamworks.Shutdown()
```
