# Bone.GetRotation

This method returns the position of a bone.

## Syntax

```csharp
public Vec3 GetRotation(bool global = false)
```

| Parameter | Description |
|---|---|
| global | if set to true rotation is relative to the skeleton, otherwise it is relative to the bone's parent |

## Returns

Returns the bone's rotation.

## Example

```csharp
Vec3 rotation = bone.GetRotation();
```

In the above example, the `GetRotation` method is called on a `bone` object, and the resulting rotation of the bone is stored in a `Vec3` variable called `rotation`.