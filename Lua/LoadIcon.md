# LoadIcon

This function loads a vector image from a file path or stream.

## Syntax

```lua
LoadIcon(path: string, flags: number): Icon
LoadIcon(stream: Stream, flags: number): Icon
```

- `path`: file path to load the icon from
- `stream`: stream to load the icon from
- `flags`: optional loading flags

## Returns

Returns the loaded icon object if successful, otherwise `nil` is returned.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 800, displays[1])

--Create user interface
local ui = CreateInterface(window)

--Create a pixmap
local icon = LoadIcon("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Logos/23.svg")

--Show the icon
ui.root.SetIcon(icon)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        break
    end
end
```