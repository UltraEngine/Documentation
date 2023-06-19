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
