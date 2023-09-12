# Mesh:Rotate

This method rotates all vertex positions by the specified rotation.

## Syntax 

- **Rotate**(pitch: number, yaw: number, roll: number): void
- **Rotate**(rotation: [Vec3](#vec3-class)): void
- **Rotate**(rotation: [Quat](#quat-class)): void

### Parameters
- **pitch**: number - the pitch rotation in degrees
- **yaw**: number - the yaw rotation in degrees
- **roll**: number - the roll rotation in degrees
- **rotation**: [Vec3](#vec3-class) - the rotation vector composed of pitch, yaw, and roll angles
- **rotation**: [Quat](#quat-class) - the rotation quaternion

## Example

```
-- Rotate the mesh by the specified pitch, yaw, and roll angles
mesh:Rotate(30.0, 45.0, 60.0)

-- Rotate the mesh using a rotation vector
local rotation = Vec3(0.0, 90.0, 0.0)
mesh:Rotate(rotation)

-- Rotate the mesh using a rotation quaternion
local quatRotation = Quat()
quatRotation:FromEulerAngles(0.0, 45.0, 0.0)
mesh:Rotate(quatRotation)
```