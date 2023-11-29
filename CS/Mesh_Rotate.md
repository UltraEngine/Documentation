## Syntax

- void **Rotate**(float pitch, float yaw, float roll)
- void **Rotate**(Vec3 rotation)
- void **Rotate**(Quat rotation)

| Parameter | Description |
|---|---|
| rotation | rotation of mesh vertices (pitch, yaw, roll) |


## Example

C# code for rotating the mesh vertices using the `Rotate` method:

```csharp
// Declare and initialize rotation values
float pitch = 45.0f;
float yaw = 30.0f;
float roll = 60.0f;

// Rotate the mesh vertices
mesh.Rotate(pitch, yaw, roll);

// OR

// Declare and initialize rotation vector
Vec3 rotation = new Vec3(45.0f, 30.0f, 60.0f);

// Rotate the mesh vertices
mesh.Rotate(rotation);

// OR

// Declare and initialize rotation quaternion
Quat rotation = new Quat(...);

// Rotate the mesh vertices
mesh.Rotate(rotation);
```