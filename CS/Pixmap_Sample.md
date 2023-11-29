# Pixmap.Sample

This method retrieves a pixel sample using bilinear filtering to smoothly interpolate between pixels.

## Syntax

- [Vec4](Vec4.md) **Sample**(float u, float v)
- [Vec4](Vec4.md) **Sample**([Vec2](Vec2.md) coords)
- [Vec4](Vec4.md) **Sample**([IntVec2](IntVec2.md) coords)

| Parameter | Description |
|---|---|
| (u, v), coords | sample coordinate or pixel |

## Returns 

Returns a bilinear filtered pixel sample at the specified coordinate.

If the pixmap uses a compressed format, [Vec4](Vec4.md)(0) will be returned.

## Remarks

Float coordinates will be clamped to the range 0.0-1.0.

If coords is an [IntVec2](IntVec2.md), bilinear filtering will not be used.

```csharp
// Example usage
Vec4 sample = Pixmap.Sample(0.5f, 0.2f);
Vec4 sample2 = Pixmap.Sample(new Vec2(0.5f, 0.2f));
Vec4 sample3 = Pixmap.Sample(new IntVec2(2, 3));
```