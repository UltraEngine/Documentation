# TransformCoord #
This function transforms a screen coordinate from one window to another, from a window to the desktop, or from the desktop to a window.

## Syntax ##
- [iVec2](iVec2.md) **TransformCoord**(const int x, const int y, shared_ptr<[Window](Window.md)\> src, shared_ptr<[Window](Window.md)\> dst)
- [iVec2](iVec2.md) **TransformCoord**(const [iVec2](iVec2.md)& coord, shared_ptr<[Window](Window.md)\> src, shared_ptr<[Window](Window.md)\> dst)

### Parameters ###
| Name | Description |
| --- | --- |
| x | X component of the coordinate to transform |
| y | Y component of the coordinate to transform |
| coord | coordinate to transform |
| src | source window to transform the coordinate from, or NULL for the desktop |
| dst | destination window to transform the coordinate to, or NULL for the desktop |

## Returns ##
Returns the transformed coordinate relative to the destination window.