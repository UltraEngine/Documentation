# dMat4
This structure describes a 4x4 matrix with double float precision.

## Properties

| Name | Type | Description |
|---|---|---|
| i | [dVec4](dVec4) | first matrix row |
| j | [dVec4](dVec4) | second matrix row |
| k | [dVec4](dVec4) | third matrix row |
| t | [dVec4](dVec4) | fourth matrix row |
| dMat4 | Constructor | dMat4() |
| dMat4 | Constructor | dMat4(const double scale) |
| dMat4 | Constructor | dMat4(const [dVec4](dVec4)& i, const [dVec4](dVec4)& j, const [dVec4](dVec4)& k, const [dVec4](dVec4)& t) |
| dMat4 | Constructor | dMat4(const [dVec3](dVec3)& translation, const [dVec3](dVec3)& rotation, const [dVec3](dVec3)& scale) |
| dMat4 | Constructor | dMat4(const [dVec3](dVec3)& translation, const [dQuat](dQuat)& rotation, const [dVec3](dVec3)& scale) |
| [Determinant](dMat4_Determinant.md) | Method | gets the matrix determinant |
| [GetQuaternion](dMat4_GetQuaterniont.md) | Method | gets the matrix rotation |
| [GetRotation](dMat4_GetRotation.md) | Method | gets the matrix Euler rotation |
| [GetScale](dMat4_GetScale.md) | Method | gets the matrix scale |
| [GetTranslation](dMat4_GetTranslation.md) | Method | gets the matrix translation |
| [Inverse](dMat4_Inverse.md) | Method | gets the inverse matrix |
| [Normalize](dMat4_Normalize.md) | Method | gets the normalized matrix |
| [Transpose](dMat4_Transpose.md) | Method | gets the transpose matrix |

## Usage in C#

### Declaration
```csharp
public class dMat4
{
    public dVec4 i;
    public dVec4 j;
    public dVec4 k;
    public dVec4 t;
    
    public dMat4();
    public dMat4(double scale);
    public dMat4(dVec4 i, dVec4 j, dVec4 k, dVec4 t);
    public dMat4(dVec3 translation, dVec3 rotation, dVec3 scale);
    public dMat4(dVec3 translation, dQuat rotation, dVec3 scale);

    public double Determinant();
    public dQuat GetQuaternion();
    public dVec3 GetRotation();
    public dVec3 GetScale();
    public dVec3 GetTranslation();
    public dMat4 Inverse();
    public dMat4 Normalize();
    public dMat4 Transpose();
}
```

### Usage
```csharp
// Create a new dMat4 object
dMat4 matrix1 = new dMat4();

// Create a new dMat4 object with a specific scale
dMat4 matrix2 = new dMat4(2.0);

// Create a new dMat4 object with specific vectors for each row
dVec4 vec1 = new dVec4(1.0, 0.0, 0.0, 0.0);
dVec4 vec2 = new dVec4(0.0, 1.0, 0.0, 0.0);
dVec4 vec3 = new dVec4(0.0, 0.0, 1.0, 0.0);
dVec4 vec4 = new dVec4(0.0, 0.0, 0.0, 1.0);
dMat4 matrix3 = new dMat4(vec1, vec2, vec3, vec4);

// Create a new dMat4 object with translation, rotation, and scale vectors
dVec3 translation = new dVec3(1.0, 2.0, 3.0);
dVec3 rotation = new dVec3(0.0, 0.0, 0.0);
dVec3 scale = new dVec3(1.0, 1.0, 1.0);
dMat4 matrix4 = new dMat4(translation, rotation, scale);

// Create a new dMat4 object with translation, quaternion rotation, and scale vectors
dQuat quatRotation = new dQuat(0.0, 0.0, 0.0, 1.0);
dMat4 matrix5 = new dMat4(translation, quatRotation, scale);

// Get the determinant of a dMat4 object
double determinant = matrix1.Determinant();

// Get the rotation quaternion of a dMat4 object
dQuat rotationQuaternion = matrix1.GetQuaternion();

// Get the Euler rotation angles of a dMat4 object
dVec3 rotationAngles = matrix1.GetRotation();

// Get the scale vector of a dMat4 object
dVec3 scaleVector = matrix1.GetScale();

// Get the translation vector of a dMat4 object
dVec3 translationVector = matrix1.GetTranslation();

// Get the inverse matrix of a dMat4 object
dMat4 inverseMatrix = matrix1.Inverse();

// Get the normalized matrix of a dMat4 object
dMat4 normalizedMatrix = matrix1.Normalize();

// Get the transpose matrix of a dMat4 object
dMat4 transposeMatrix = matrix1.Transpose();
```
