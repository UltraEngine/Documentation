# Display:GetPosition

This method retrieves the display position on the virtual display.

## Syntax

- [iVec2](iVec2.md) **GetPosition**()

## Returns

Returns the display's position on the bounding virtual display.

## Example

```lua
-- Get all displays
local displays = UltraEngine.GetDisplays()

-- Iterate through displays
for k=0, #displays do
    print("Display " .. k .. ":")
    print("    Position: " .. tostring(displays[k]:GetPosition()))
    print("    Size: " .. tostring(displays[k]:GetSize()))
    print("    Scale: " .. tostring(displays[k]:GetScale()))
    print("    Graphics Modes:")
    
    -- Get graphics modes
    local gfxmodes = displays[k]:GraphicsModes()
    
    -- Iterate through graphics modes
    for n=0, #gfxmodes do
        print("        " .. n .. ": " .. tostring(gfxmodes[n]))
    end
end
```
