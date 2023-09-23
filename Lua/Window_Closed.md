# Window:Closed

This method returns true if the window has been closed since the last call, or since the creation of the window.

## Syntax

- boolean **Closed**()

## Returns

Returns the window closed state and resets the state to false.

## Remarks

This method uses a global state to detect when the window has been closed. If two different parts of your application call the method, only one will detect the close event. For finer control, use the events system and listen for WINDOWCLOSE events.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

while not window:Closed() do
    WaitEvent()
end
```
