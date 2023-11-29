### Syntax

```csharp
public Entity Copy(World world, bool recursive = true, bool callstart = true)
```

### Parameters

| Parameter | Description |
| --- | --- |
| world | The world to create the new copy in. |
| recursive | If set to true, the entity subhierarchy will also be copied. |
| callstart | If set to true, the Start function will be called for all attached actors and scripts. |

### Returns

Returns a copy of the entity.