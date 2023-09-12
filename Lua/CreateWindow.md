# createWindow

This function is used to create a new window.

## Syntax

`createWindow(title: string, x: number, y: number, width: number, height: number, display: Display, style: WindowStyle): Window`

`createWindow(title: string, x: number, y: number, width: number, height: number, parent: Window, style: WindowStyle): Window`

- `title`: text to display in the titlebar
- `x`: initial x position of the window
- `y`: initial y position of the window
- `width`: initial width of the window
- `height`: initial height of the window
- `display`: Display to create the window on
- `parent`: parent Window
- `style`: can be any combination of `WINDOW_TITLEBAR`, `WINDOW_RESiZABLE`, `WINDOW_CENTER`, `WINDOW_HIDDEN`, `WINDOW_CHILD`, `WINDOW_CLIENTCOORDS`, and `WINDOW_ACCEPTFILES`

## Example

```lua
-- Get the display
local displays = getDisplays()
local displayscale = displays[1]:getScale()

-- Create a window
local style = WINDOW_TITLEBAR | WINDOW_CENTER
local window = createWindow("Example", 0, 0, 400 * displayscale.x, 300 * displayscale.y, displays[1], style)

-- Main loop
while not window:closed() do
    if window:keyDown(KEY_ESCAPE) then
        break
    end
end
```