### Syntax

```csharp
void SetVertexTexCoords(uint index, float u, float v, int texcoordset = 0);
void SetVertexTexCoords(uint index, Vec2 texcoords, int texcoordset = 0);
```

### Parameters

| Parameter | Description |
|---|---|
| `index` | vertex index, starting with zero |
| `texcoords`, `(u, v)` | vertex texture coordinates to set |
| `texcoordset` | texture coordinate set, can be 0 or 1 |