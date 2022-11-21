# Bone::GetPosition

This method sets the position of a bone.

## Syntax

- void **SetPosition**(const float x, const float y, const float z)
- void **SetPosition**(const [Vec3.md](Vec3.md)& position)

| Parameter | Description |
|---|---|
| position, (x, y, z) | position to set |
| global | if set to true position is relative to the skeleton, otherwise it is relative to the bone's parent |
