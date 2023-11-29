# Vec2
This structure describes a two-dimensional vector.

| Property | Type | Description |
| - | - | - |
| x | float | x component of the vector |
| y | float | y component of the vector |
| Vec2 | Constructor | Vec2(float x) |
| Vec2 | Constructor | Vec2(float x, float y) |
| [Length](Vec2_Length) | Method | returns the length of the vector | 
| [Normalize](Vec2_Normalize.md) | Method | returns the normalized vector |

### Example
```csharp
public struct Vec2
{
    public float x; // x component of the vector
    public float y; // y component of the vector

    public Vec2(float x)
    {
        this.x = x;
        this.y = 0;
    }

    public Vec2(float x, float y)
    {
        this.x = x;
        this.y = y;
    }

    public float Length()
    {
        return Mathf.Sqrt(x * x + y * y);
    }

    public Vec2 Normalize()
    {
        float magnitude = Length();
        return new Vec2(x / magnitude, y / magnitude);
    }
}
```