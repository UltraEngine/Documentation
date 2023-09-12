# Pixmap:Resize

This method resizes a pixmap to make it larger or smaller.

## Syntax

```lua
function Pixmap:Resize(width: number, height: number) --> table or boolean
```

## Parameters

- `width` (number): The width dimension for resizing the pixmap.
- `height` (number): The height dimension for resizing the pixmap.

## Returns

- (table or boolean): Returns a new pixmap or a boolean indicating success or failure, depending on which overload is used.

If the destination pixmap's dimensions don't match the specified width and height, `false` is returned.

If the destination pixmap's format doesn't match the pixmap's format, `false` is returned.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

--Create user interface
local ui = CreateInterface(window)

--Create a pixmap
local pixmap = LoadPixmap("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Ground/dirt01.dds")

--Resize the pixmap
pixmap = pixmap:Resize(128, 128)

--Show the pixmap
ui.root:SetPixmap(pixmap)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
