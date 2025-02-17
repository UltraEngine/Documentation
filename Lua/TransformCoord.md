# TransformCoord

This function transforms a screen coordinate from one window to another, from a window to the desktop, or from the desktop to a window.

## Syntax

- [iVec2](iVec2.md) **TransformCoord**(number x, number y, [Window](Window.md) src, [Window](Window.md) dst)
- [iVec2](iVec2.md) **TransformCoord**([iVec2](iVec2.md) coord, [Window](Window.md) src, [Window](Window.md) dst)

Parameter | Description
--- | ---
x | X component of the coordinate to transform
y | Y component of the coordinate to transform
coord | coordinate to transform
src | source window to transform the coordinate from, or nil for the desktop
dst | destination window to transform the coordinate to, or nil for the desktop

## Returns

Returns the transformed coordinate relative to the destination window.

## Example

```lua
-------------------------------------------------------------------------------------------------
--
-- This example shows two windows with their positions transformed to each other's client area
--
-------------------------------------------------------------------------------------------------

-- Create windows
local displays = GetDisplays()
local window1 = CreateWindow("Window 1", 0, 0, 640, 480, displays[1], WINDOW_TITLEBAR)
local window2 = CreateWindow("Window 2", 200, 200, 640, 480, displays[1], WINDOW_TITLEBAR)

local pos = TransformCoord(window1:GetPosition(), nil, window2)
window1:SetText("Window 1: " .. tostring(pos.x) .. ", " .. tostring(pos.y))
pos = TransformCoord(window2:GetPosition(), nil, window1)
window2:SetText("Window 2: " .. tostring(pos.x) .. ", " .. tostring(pos.y))

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWMOVE then
        pos = TransformCoord(window1:GetPosition(), nil, window2)
        window1:SetText("Window 1: " .. tostring(pos.x) .. ", " .. tostring(pos.y))
        pos = TransformCoord(window2:GetPosition(), nil, window1)
        window2:SetText("Window 2: " .. tostring(pos.x) .. ", " .. tostring(pos.y))
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
