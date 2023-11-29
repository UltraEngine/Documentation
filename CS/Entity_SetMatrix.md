## Syntax

- void **SetMatrix**(xMat4 matrix, bool global = true)

| Parameter | Description |
|---|---|
| matrix | the 4x4 matrix to set |
| global | if true world space will be used, otherwise the entity's local space will be used |

## Example

```csharp
// Create a new 4x4 matrix
Matrix4x4 matrix = new Matrix4x4();

// Set the values of the matrix for position, rotation, and scale
matrix.m00 = 1.0f;
matrix.m11 = 1.0f;
matrix.m22 = 1.0f;
matrix.m33 = 1.0f;

// Set the entity's matrix using the world space
entity.SetMatrix(matrix, true);
```

```csharp
// Create a new 4x4 matrix
Matrix4x4 matrix = new Matrix4x4();

// Set the values of the matrix for position, rotation, and scale
matrix.m00 = 1.0f;
matrix.m11 = 1.0f;
matrix.m22 = 1.0f;
matrix.m33 = 1.0f;

// Set the entity's matrix using the entity's local space
entity.SetMatrix(matrix, false);
```