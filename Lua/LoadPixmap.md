# LoadPixmap

This function loads a pixmap from a file path or stream.

## Syntax

- [Pixmap](Pixmap.md) **LoadPixmap**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path, number miplevel = 1, number face = 1, number flags = LOAD_DEFAULT)
- [Pixmap](Pixmap.md) **LoadPixmap**([Stream](Stream.md), number miplevel = 1, number face = 1, number flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load the pixmap from |
| stream | stream to load the pixmap from |
| miplevel | optional mipmap level to load |
| face | optional texture face to load |
| flags | optional load flags |

## Returns

Returns the loaded pixmap, or NULL if no pixmap was loaded.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)

-- Create a pixmap
local pixmap = LoadPixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds")

-- Show the pixmap
ui.root:SetPixmap(pixmap)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        break
    end
end
```
