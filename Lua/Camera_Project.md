# Camera:Project

This method projects a 3D position onto 2D screen space.

## Syntax

`Project(point, framebuffer)`

## Parameters

- `point` ([Vec3](Vec3.md)): position in global space
- `framebuffer` (shared_ptr<[Framebuffer](Framebuffer.md)>): framebuffer to test with

## Returns

Returns a screen coordinate with the distance in front of the camera stored in the Z component.