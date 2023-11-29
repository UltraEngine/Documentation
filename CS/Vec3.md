# Vec3
This structure describes a three-dimensional vector.

| Property | Type | Description |
| - | - | - |
| x, r | float | x component of the vector |
| y, g | float | y component of the vector |
| z, b | float | z component of the vector |
| Vec3 | Constructor | Vec3(float x) |
| Vec3 | Constructor | Vec3(float x, float y, float z)|
| [DistanceToPoint](Vec3_DistanceToPoint.md) | Method | gets the vector dot product |
| [Dot](Vec3_Dot.md) | Method | gets the distance to a point |
| [Cross](Vec3_Cross.md) | Method | gets the vector cross product |
| [Hsl](Vec3_Hsl) | Method | converts an RGB value to HSL |
| [Inverse](Vec3_Inverse.md) | Method | gets the inverse vector |
| [Length](Vec3_Length.md) | Method | gets the vector length |
| [Normalize](Vec3_Normalize.md) | Method | gets the normalized vector |
| [Reflect](Vec3_Reflect.md) | Method | gets the reflected vector |
| [Rgb](Vec3_Rgb) | Method | converts an HSL value to RGB |

## Example

```csharp
Vec3 vector = new Vec3(1.0f, 2.0f, 3.0f);
Vec3 anotherVector = new Vec3(4.0f, 5.0f, 6.0f);

float distance = vector.Dot(anotherVector);
Vec3 crossProduct = vector.Cross(anotherVector);
Vec3 inverseVector = vector.Inverse();
float length = vector.Length();
Vec3 normalizedVector = vector.Normalize();
Vec3 reflectedVector = vector.Reflect(anotherVector);
```