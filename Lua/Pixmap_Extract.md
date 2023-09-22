# Pixmap:Extract

This method extracts an area of the pixmap and returns it as a new pixmap.

## Syntax

- [Pixmap](Pixmap.md) **Extract**(number x, number y, number width, number height)

| Parameter | Description |
|---|---|
| (x, y) | position of the extracted area |
| (width, height) | dimensions of the extracted area |

## Returns

Returns a new [Pixmap](Pixmap.md) object if successful, otherwise NULL is returned.

If the extracted area lies outside the bounds of the pixmap then NULL will be returned.

If the pixmap uses a compressed format and the position and dimensions of the extracted area are not evenly divisible by the block size then NULL will be returned.
