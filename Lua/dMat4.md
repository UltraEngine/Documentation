# dMat4
This structure describes a 4x4 matrix with double float precision.

## Properties

| Name | Type | Description |
|---|---|---|
| i | dVec4 | first matrix row |
| j | dVec4 | second matrix row |
| k | dVec4 | third matrix row |
| t | dVec4 | fourth matrix row |

## Constructors

### dMat4()

```lua
dMat4()
```

Creates a new dMat4 object with default values.

### dMat4(scale: number)

```lua
dMat4(scale: number)
```

Creates a new dMat4 object with the given scale.

### dMat4(i: dVec4, j: dVec4, k: dVec4, t: dVec4)

```lua
dMat4(i: dVec4, j: dVec4, k: dVec4, t: dVec4)
```

Creates a new dMat4 object with the given rows.

### dMat4(translation: dVec3, rotation: dVec3, scale: dVec3)

```lua
dMat4(translation: dVec3, rotation: dVec3, scale: dVec3)
```

Creates a new dMat4 object with the given translation, rotation, and scale.

### dMat4(translation: dVec3, rotation: dQuat, scale: dVec3)

```lua
dMat4(translation: dVec3, rotation: dQuat, scale: dVec3)
```

Creates a new dMat4 object with the given translation, quaternion rotation, and scale.

## Methods

- [Determinant](dMat4_Determinant.md): gets the matrix determinant.
- [GetQuaternion](dMat4_GetQuaterniont.md): gets the matrix rotation.
- [GetRotation](dMat4_GetRotation.md): gets the matrix Euler rotation.
- [GetScale](dMat4_GetScale.md): gets the matrix scale.
- [GetTranslation](dMat4_GetTranslation.md): gets the matrix translation.
- [Inverse](dMat4_Inverse.md): gets the inverse matrix.
- [Normalize](dMat4_Normalize.md): gets the normalized matrix.
- [Transpose](dMat4_Transpose.md): gets the transpose matrix.