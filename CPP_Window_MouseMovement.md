# Window::MouseMovement #
Thie method returns the physical distance the mouse has travelled since the last call, or since the creation of the window.

## Syntax ##
- Vec2 **MouseMovement**(const int dpi = 1000)

### Parameters ###
| Name | Description |
|---|---|
| dpi | mouse movement increments per inch physical distance traveled |

## Returns ##
Returns the physical distance traveled by the mouse, in inches.

## Remarks ##
This method uses raw mouse input and does not correlate to a cursor position onscreen. Whereas the [MousePosition](Window_MousePosition.md) method returns integer coordinates based on screen pixels, this method allow higher precision input and is useful for games.

The DPI value should be adjustable by the end user to adjust the mouse precision. Most mice will use a DPI in the range of 800-1200 but high-precision gaming mice can use much greater values.

Calls to MoveMouse() have no effect on raw mouse input. Raw mouse movement is not bound by the edges of the screen.
