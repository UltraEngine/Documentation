# display.GetScale

This function retrieves the display scaling factor that is currently in use on this display.

## Syntax

```lua
function display.GetScale()
```

## Returns

Returns the scaling factor of this display.

## Example

```lua
local displays = GetDisplays()

for k=1, #displays do
    print("Display " .. tostring(k) .. ":")
    print(" Position: " .. tostring(displays[k]:GetPosition()))
    print(" Size: " .. tostring(displays[k]:GetSize()))
    print(" Scale: " .. tostring(displays[k]:GetScale()))
    print(" Graphics Modes:")
    local gfxmodes = displays[k].graphicsmodes
    for n=1, #gfxmodes do
        print("     " .. tostring(n) .. ": " .. tostring(gfxmodes[n]))
    end
end
```