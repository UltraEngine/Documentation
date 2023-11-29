# Vec4

This class describes a four-dimensional vector or an RGBA color.

| Property | Type | Description |
| --- | --- | --- |
| x, r | float | x component of the vector, or red channel of color |
| y, g | float | y component of the vector, or green channel of color |
| z, b | float | z component of the vector, or blue channel of color |
| w, a | float | w component of the vector, or alpha channel of color |
| Vec4 | Constructor | Vec4(float x) |
| Vec4 | Constructor | Vec4(float x, float y) |
| Vec4 | Constructor | Vec4(float x, float y, float z) |
| Vec4 | Constructor | Vec4(float x, float y, float z, float w) |
| Vec4 | Constructor | Vec4(Vec3 v, float w) |

## Example

```csharp
Vec4 vec1 = new Vec4(1.0f);
Vec4 vec2 = new Vec4(1.0f, 2.0f);
Vec4 vec3 = new Vec4(1.0f, 2.0f, 3.0f);
Vec4 vec4 = new Vec4(1.0f, 2.0f, 3.0f, 4.0f);
Vec3 v = new Vec3(1.0f, 2.0f, 3.0f);
Vec4 vec5 = new Vec4(v, 4.0f);
```