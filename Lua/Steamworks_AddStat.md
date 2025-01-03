# AddStat

Namespace: [Steamworks](Steamworks.md)

This function increments the user statistic for this game by the specified value.

## Syntax

- boolean **AddStat**([string](https://www.lua.org/manual/5.4/manual.html#6.4) name, number add = 1)

## Returns

Returns true if the value was successfully modified, otherwise false is returned.

## Remarks

Since GetStat() can return -1 if the value is not successfully retrieved, it is better to use this function rather than calling SetStat(name, GetStat(name) + 1), which could potentially reset the user's progress.

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
