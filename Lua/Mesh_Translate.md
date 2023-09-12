# translate

This function translates all vertex positions of the mesh by the specified offset.

## Syntax

- **translate**(x: number, y: number, z: number): void
- **translate**(offset: Vec3): void

## Parameters

- **offset** (x, y, z) - offset to translate mesh vertices by. This can be specified as separate x, y, z values or as a single Vec3 object.

## Example

```lua
local mesh = {} -- assume mesh is already defined

mesh.translate(1.0, 2.0, 3.0) -- translate mesh vertices by the specified offset

-- or

local offset = {x = 1.0, y = 2.0, z = 3.0}
mesh.translate(offset) -- translate mesh vertices by the specified offset
```