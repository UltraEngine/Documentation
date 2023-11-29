### Syntax

```csharp
void Recenter(bool x = true, bool y = true, bool z = true);
```

### Parameters

| Parameter | Description |
|---|---|
| x, y, z | If set to true, the mesh will be recentered along the corresponding axis. |

### Example

```csharp
Mesh.Recenter(true, false, true);
```

In this example, the mesh will be recentered along the x and z axes, but not along the y axis.