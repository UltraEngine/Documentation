# Pixmap::Sample

This method retrieves a pixel sample using bilinear filtering to smoothly interpolate between pixels.

## Syntax

- [Vec4](Vec4.md) **Sample**(const float u, const float v)
- [Vec4](Vec4.md) **Sample**(const [Vec2](Vec2.md)& coords)

| Parameter | Description |
|---|---|
| (u, v), coords | sample coordinate, which will be clamp to the range 0.0-1.0 |

## Returns 

Returns a linear filtered sample at the specified coordinate.
