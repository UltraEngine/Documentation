# Window::MouseMovement #
Thie method returns the physical distance the mouse has travelled since the last call, or since the creation of the window.

## Syntax ##
- Vec2 **MouseMovement**(const int dpi = 1000)

| Name | Description |
|---|---|
| dpi | mouse movement increments per inch physical distance traveled |

## Remarks ##
This method uses raw mouse input and does not correlate to a cursor position onscreen. Whereas the [MousePosition](Window_MousePosition.md)() method returns integer coordinates based on screen pixels, this method allow higher precision input and is useful for games.

Calls to MoveMouse() have no effect on raw mouse input.
