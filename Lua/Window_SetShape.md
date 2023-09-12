# window.SetShape

This function sets the window's position and size.

## Syntax

- **window: SetShape**(x: number, y: number, width: number, height: number)
- **window: SetShape**(position: iVec2, size: iVec2)

| Parameter | Description |
| --- | --- |
| x, y | new window screen position |
| width, height | new window size |

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

--Create user interface
local ui = CreateInterface(window)

--Adjust window position
local dsz = displays[1]:GetSize()
local wsz = window:GetSize()
window:SetShape((dsz.x - wsz.x) / 2, (dsz.y - wsz.y) / 2, wsz.x, wsz.y)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        break
    end
end