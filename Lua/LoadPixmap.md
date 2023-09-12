# LoadPixmap

This function loads a pixmap from a file path or stream.

## Syntax

- ```lua
    LoadPixmap(path: string, miplevel: number, face: number, flags: number): Pixmap
  ```
- ```lua
    LoadPixmap(stream: Stream, miplevel: number, face: number, flags: number): Pixmap
  ```

  - `path` : file path to load the pixmap from.
  - `stream` : stream to load the pixmap from.
  - `miplevel` : optional mipmap level to load.
  - `face` : optional texture face to load.
  - `flags` : optional load flags.

## Returns

Returns the loaded pixmap or `nil` if no pixmap was loaded.

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
