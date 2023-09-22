# Display:GetSize

This method retrieves the display size.

## Syntax

- [iVec2](iVec2.md) **GetSize**()

## Returns

Returns the display's size, in screen pixels.

## Example

```lua
-- Displays are already imported

local displays = GetDisplays()

for k=1, #displays do
    Print("Display " .. tostring(k) .. ":")
    Print(" Position: " .. tostring(displays[k]:GetPosition()))
    Print(" Size: " .. tostring(displays[k]:GetSize()))
    Print(" Scale: " .. tostring(displays[k]:GetScale()))
    Print(" Graphics Modes:")

    local gfxmodes = displays[k]:graphicsmodes
    for n=1, #gfxmodes do
        Print("     " .. tostring(n) .. ": " .. tostring(gfxmodes[n]))
    end
end

```
