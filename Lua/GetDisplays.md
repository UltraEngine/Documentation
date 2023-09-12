# GetDisplays

This function retrieves a list of hardware monitors that are currently in use.

## Syntax

```lua
function GetDisplays() --> table
```

## Returns

Returns a table of all displays currently in use, with the primary display at index 1.

## Example

```lua
function main()
    local displays = GetDisplays()

    for k = 1, #displays do
        print("Display " .. tostring(k) .. ":")
        print(" Position: " .. tostring(displays[k]:GetPosition()))
        print(" Size: " .. tostring(displays[k]:GetSize()))
        print(" Scale: " .. tostring(displays[k]:GetScale()))
        print(" Graphics Modes:")
        local gfxmodes = displays[k]:graphicsmodes
        for n = 1, #gfxmodes do
            print("     " .. tostring(n) .. ": " .. tostring(gfxmodes[n]))
        end
    end
end

main()
```