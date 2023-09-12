# Vec4

This class describes a four-dimensional vector or an RGBA color.

| Property | Type | Description |
| - | - | - |
| x, r | number | x component of the vector, or red channel of color |
| y, g | number | y component of the vector, or green channel of color |
| z, b | number | z component of the vector, or blue channel of color |
| w, a | number | w component of the vector, or alpha channel of color |
| Vec4 | Constructor | Vec4(x: number) |
| Vec4 | Constructor | Vec4(x: number, y: number) |
| Vec4 | Constructor | Vec4(x: number, y: number, z: number) |
| Vec4 | Constructor | Vec4(x: number, y: number, z: number, w: number) |
| Vec4 | Constructor | Vec4(v: [Vec3](Vec3.md), w: number) |

## Example

```lua
-- create a Vec4 object with only x component
local vec1 = Vec4(1.0)

-- create a Vec4 object with x and y components
local vec2 = Vec4(2.0, 3.0)

-- create a Vec4 object with x, y, and z components
local vec3 = Vec4(4.0, 5.0, 6.0)

-- create a Vec4 object with x, y, z, and w components
local vec4 = Vec4(7.0, 8.0, 9.0, 10.0)

-- create a Vec4 object from a Vec3 object and a w component
local vec5 = Vec4(Vec3(1.0, 2.0, 3.0), 4.0)
```