## Syntax

- void **SetHeight**(int x, int y, float height)
- void **SetHeight**([iVec2](iVec2.md) coord, float height)

| Parameter | Description |
|---|---|
| coord, (x, y) | terrain coordinate |
| height | height to set |

### Example

```csharp
// Set height at coordinate (2, 3) to 0.8
SetHeight(2, 3, 0.8);

// Set height at coordinate (4, 1) to 0.5
iVec2 coord = new iVec2(4, 1);
SetHeight(coord, 0.5);
```