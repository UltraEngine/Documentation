# Camera.Project

This method projects a 3D position onto 2D screen space.

## Syntax

```csharp
Vec3 Project(Vec3 point, Framebuffer framebuffer)
```

| Parameter | Description |
|---|---|
| point | position in global space |
| framebuffer | framebuffer to test with |

## Returns

Returns a screen coordinate with the distance in front of the camera stored in the Z component.

Example:

```csharp
Vec3 point = new Vec3(1, 2, 3);
Framebuffer framebuffer = new Framebuffer();
Vec3 screenCoordinate = Camera.Project(point, framebuffer);
```