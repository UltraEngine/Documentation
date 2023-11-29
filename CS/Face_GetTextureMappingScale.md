## Syntax

- [Vector2](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector2) **GetTextureMappingScale**()

## Returns

Returns the face texture mapping scale.

## Example

```csharp
using UnityEngine;

public class Example : MonoBehaviour
{
    void Start()
    {
        Vector2 textureMappingScale = Face.GetTextureMappingScale();
        Debug.Log(textureMappingScale);
    }
}
```