# Face::GetMaterial

This method returns the material for this face.

## Syntax

```csharp
public Material GetMaterial()
```

## Returns

Returns the face material or `null` if no material is in use.

Example:

```csharp
var material = face.GetMaterial();
if (material != null)
{
    // Do something with the material
}
```