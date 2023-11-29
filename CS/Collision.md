# Collision

Base class: [Object](Object.md)

This class stores information about a collision.

| Property | Type | Description |
|---|---|---|
| entities | List<shared_ptr<[Entity](Entity.md)>> | colliding entities |
| position | [xVec3](xVec3.md) | collision position |
| normal | [xVec3](xVec3.md) | collision normal |
| speed | float | collision speed |

## Example

```csharp
using System;
using System.Collections.Generic;

public class Collision
{
    public List<SharedEntity> entities { get; set; }
    public xVec3 position { get; set; }
    public xVec3 normal { get; set; }
    public float speed { get; set; }
}

public class SharedEntity
{
    // properties and methods of the SharedEntity class
}

public class xVec3
{
    // properties and methods of the xVec3 class
}
```
