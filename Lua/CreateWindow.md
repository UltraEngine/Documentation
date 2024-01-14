# CreateWindow

This function is used to create a new window.

## Syntax

- [Window](Window.md) **CreateWindow**([string](https://www.lua.org/manual/5.4/manual.html#6.4) title, number x, number y, number width, number height, [Display](Display.md) display, number style = WINDOW_DEFAULT)
- [Window](Window.md) **CreateWindow**([string](https://www.lua.org/manual/5.4/manual.html#6.4) title, number x, number y, number width, number height, [Window](Window.md) parent, number style = WINDOW_DEFAULT)

| Parameter | Description |
| ------ | ------ |
| title | text to display in the titlebar |
| x | initial x position of the window |
| y | initial y position of the window |
| width | initial width of the window |
| height | initial height of the window |
| display | Display to create the window on |
| parent | parent Window |
| style | can be any combination of WINDOW_TITLEBAR, WINDOW_RESiZABLE, WINDOW_CENTER, WINDOW_HIDDEN, WINDOW_CHILD, WINDOW_CLIENTCOORDS, WINDOW_FULLSCREEN, and WINDOW_ACCEPTFILES |

## Remarks

A framebuffer cannot be created on a window that uses the WINDOW_RESIZABLE window style, unless the multi-threaded renderer is disabled by calling [AsyncRender](AsyncRender.md) prior to engine initialization.

## Example

```lua
-- Get the display
local displays = GetDisplays()
local displayscale = displays[1]:GetScale()

-- Create a window
local style = WINDOW_TITLEBAR | WINDOW_CENTER
local window = CreateWindow("Example", 0, 0, 400 * displayscale, 300 * displayscale, displays[1], style)

-- Main loop
while not window:Closed() do
    if window:KeyDown(KEY_ESCAPE) then
        break
    end
end
```
