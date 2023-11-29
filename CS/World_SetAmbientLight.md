## Syntax

- void **SetAmbientLight**(float r, float g, float b)
- void **SetAmbientLight**(Vec3 ambientlight)

| Parameter | Description |
|---|---|
| ambientlight, (r, g, b) | ambient light level |

## Example

```csharp
// Set ambient light using RGB values
engine.SetAmbientLight(0.5f, 0.5f, 0.5f);

// Set ambient light using Vec3 object
Vec3 ambientLight = new Vec3(0.5f, 0.5f, 0.5f);
engine.SetAmbientLight(ambientLight);
```