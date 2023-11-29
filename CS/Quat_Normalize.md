### Quat.Normalize

This method returns the normalized quaternion.

#### Syntax

```csharp
Quat Normalize()
```

#### Returns

Returns the normalized quaternion.

#### Example

```csharp
Quat quaternion = new Quat(0.5, 0.3, 0.1, 0.7);  // Creating a Quaternion object

Quat normalizedQuaternion = quaternion.Normalize();  // Normalizing the quaternion
```