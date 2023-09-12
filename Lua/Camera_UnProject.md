# Camera:unProject

This method projects a 2D screen coordinate to a point.

## Syntax

`Camera:unProject(coord, framebuffer)`

## Parameters

- `coord` - A [Vec3](Vec3.md) object representing the screen coordinate, with the distance in front of the camera stored in the Z component.
- `framebuffer` - A [Framebuffer](Framebuffer.md) object to test with.

## Returns

A [Vec3](Vec3.md) object representing the 3D position in global space.