### Syntax (C#)

- void **SetPosition**(Vector3 position, bool global = false)
- void **SetPosition**(float x, float y, float z, bool global = false)

| Parameter | Description |
| ------ | ------ |
| position, (x, y, z) | The position to set |
| global | Indicates whether the position should be set in global or local space |


```csharp
// Example usage
entity.SetPosition(new Vector3(10f, 5f, 0f), true);
entity.SetPosition(10f, 5f, 0f, true);
```
