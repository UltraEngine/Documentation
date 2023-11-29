# Camera.UnProject

This method projects 2D screen coordinate to a point.

## Syntax

```csharp
Vec3 UnProject(Vec3 coord, Framebuffer framebuffer)
```

| Parameter | Description |
|---|---|
| coord | screen coordinate, plus distance in front of camera stored in the Z component |
| framebuffer | framebuffer to test with |

## Returns

Returns a 3D position in global space.

## Example

```csharp
Vec3 coord = new Vec3(1.0f, 1.0f, 0.0f);
Framebuffer framebuffer = new Framebuffer();

Vec3 position = Camera.UnProject(coord, framebuffer);
```