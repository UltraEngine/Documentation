# Millisecs

This function returns the current system time, in milliseconds.

Syntax
```
function Millisecs()
```

Returns
```
Returns the current system time, in milliseconds.
```

Example
```lua
-- Get the initial system time
local starttime = Millisecs()

-- Pause for one second
Sleep(1000)

-- Show the current time relative to the starting time
local currenttime = Millisecs() - starttime
Print(currenttime)

-- Pause for one second
Sleep(1000)

-- Show the current time relative to the starting time
currenttime = Millisecs() - starttime
Print(currenttime)
```