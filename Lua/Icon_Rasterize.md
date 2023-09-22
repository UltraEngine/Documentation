# Icon:Rasterize

This method generates a pixmap from a vector image. A scaling value can be used to create the pixmap at any magnification level.

## Syntax

- [Pixmap](Pixmap.md) **Rasterize**(number scale = 1, boolean cached = true)

| Parameter | Description |
| --- | --- |
| scale | magnification value to create scaled versions of the image |
| cached | if set to true the routine will search for a cached pixmap at the specified scale, otherwise a new pixmap will always be generated |

## Returns

Returns a pixmap at the specified scale.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 800, displays[1])

--Create user interface
local ui = CreateInterface(window)

--Create a pixmap
local icon = LoadIcon("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Logos/23.svg")

--Generate a pixmap
local pixmap = icon:Rasterize(1.0)

--Show the icon
ui.background:SetPixmap(pixmap)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
