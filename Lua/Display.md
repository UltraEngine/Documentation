# Display

Base class: [Object](Object.md)

```lua
Display = Object:extend()

```

This class provides an interface for querying and managing hardware monitors.

| Property | Type | Description |
| --- | --- | --- |
| graphicsmodes | const table | read-only available screen resolutions |
| position | const table | read-only screen position on the virtual desktop |
| scale | const number | read-only DPI scaling value |
| size | const table | read-only screen dimensions |
| [ClientArea](Display_ClientArea.md) | Method | returns the usable area within the screen |
| [GetPosition](Display_GetPosition.md) | Method | returns the position of the display on the virtual monitor space |
| [GetSize](Display_GetSize.md) | Method | returns the display dimensions in pixels |
| [GetScale](Display_GetScale.md) | Method | returns the current DPI scale value |
| [GetDisplays](GetDisplays.md) | Function | returns a list of hardware displays in use |

```lua
function Display:ClientArea()
    -- Implementation goes here
end

function Display:GetPosition()
    -- Implementation goes here
end

function Display:GetSize()
    -- Implementation goes here
end

function Display:GetScale()
    -- Implementation goes here
end

function GetDisplays()
    -- Implementation goes here
end
```