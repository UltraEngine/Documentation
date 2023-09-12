## Pixmap:Extract

This function extracts an area of the pixmap and returns it as a new pixmap.

### Syntax

```lua
function Pixmap:Extract(x, y, width, height)
```

### Parameters

| Parameter | Description |
|---|---|
| x, y | Position of the extracted area |
| width, height | Dimensions of the extracted area |

### Returns

Returns a new Pixmap object if successful, otherwise nil is returned.

If the extracted area lies outside the bounds of the pixmap, then nil will be returned.

If the pixmap uses a compressed format and the position and dimensions of the extracted area are not evenly divisible by the block size, then nil will be returned.