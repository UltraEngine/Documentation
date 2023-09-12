# Mat4

This table describes a 4x4 matrix used for 3D orientations in space.

## Properties

| Name | Type | Description |
|---|---|---|
| i | [Vec4](#vec4) | first matrix row |
| j | [Vec4](#vec4) | second matrix row |
| k | [Vec4](#vec4) | third matrix row |
| t | [Vec4](#vec4) | fourth matrix row |

## Constructor

### `Mat4()`

Creates a new instance of Mat4.

### `Mat4(scale: number)`

Creates a new instance of Mat4 with a uniform scale specified by `scale`.

### `Mat4(i: Vec4, j: Vec4, k: Vec4, t: Vec4)`

Creates a new instance of Mat4 with the given row vectors `i`, `j`, `k`, and `t`.

### `Mat4(translation: Vec3, rotation: Vec3, scale: Vec3)`

Creates a new instance of Mat4 with the given translation, rotation, and scale vectors.

### `Mat4(translation: Vec3, rotation: Quat, scale: Vec3)`

Creates a new instance of Mat4 with the given translation, rotation quaternion, and scale vectors.

## Methods

### `Determinant(): number`

Gets the determinant of the matrix.

### `GetQuaternion(): Quat`

Gets the rotation quaternion of the matrix.

### `GetRotation(): Vec3`

Gets the Euler rotation angles of the matrix.

### `GetScale(): Vec3`

Gets the scale vector of the matrix.

### `GetTranslation(): Vec3`

Gets the translation vector of the matrix.

### `Inverse(): Mat4`

Gets the inverse matrix of the matrix.

### `Normalize(): Mat4`

Gets the normalized matrix.

### `Transpose(): Mat4`

Gets the transpose matrix.

## Vec4

This table represents a 4-dimensional vector.

### Properties

| Name | Type | Description |
|---|---|---|
| x | number | the x-component of the vector |
| y | number | the y-component of the vector |
| z | number | the z-component of the vector |
| w | number | the w-component of the vector |

## Quat

This table represents a quaternion.

### Properties

| Name | Type | Description |
|---|---|---|
| x | number | the x-component of the quaternion |
| y | number | the y-component of the quaternion |
| z | number | the z-component of the quaternion |
| w | number | the w-component of the quaternion |