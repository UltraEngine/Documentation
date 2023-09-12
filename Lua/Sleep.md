# Sleep

This function pauses the current thread for the specified number of milliseconds.

## Syntax

```lua
function Sleep(time: number)
```

## Parameters

- **time:** the number of milliseconds to pause.

## Remarks

This function should not be used to regulate time-sensitive processes. The accuracy of the sleep period can vary by as much as 15 milliseconds, or more.

## Example

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