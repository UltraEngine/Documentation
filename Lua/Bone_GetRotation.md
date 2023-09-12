# Bone:GetRotation

This method returns the position of a bone.

## Syntax

**bone:GetRotation**(global)

- `global` (boolean, optional): If set to `true`, rotation is relative to the skeleton. Otherwise, it is relative to the bone's parent. Default is `false`.

### Returns

- (Vec3): The bone's rotation.

## Example

```lua
local rotation = bone:GetRotation(true)
print(rotation)
```

In this example, the `GetRotation` method is called on a `bone` object with the `global` parameter set to `true`. The returned value, representing the rotation of the bone, is then printed to the console.