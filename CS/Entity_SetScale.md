## Syntax

- void **SetScale**(Vector3 scale)
- void **SetScale**(float x, float y, float z)
- void **SetScale**(float scale)

| Parameter | Description |
| ------ | ------ |
| scale, (x, y, z) | the scale to set, either a Vector3 or a uniform scale value. |



```csharp
#region Example

// Using Vector3 as the scale parameter
Vector3 scale = new Vector3(2, 2, 2);
entity.SetScale(scale);

// Using individual float values for x, y, and z
float x = 2;
float y = 2;
float z = 2;
entity.SetScale(x, y, z);

// Using a uniform scale value
float uniformScale = 2;
entity.SetScale(uniformScale);

#endregion
```