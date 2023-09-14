# Entity::SetMatrix

This method sets the entity 4x4 matrix, which describes its position, rotation, and scale in global or local space.

## Syntax

- void **SetMatrix**(const [Mat4](Mat4.md)& matrix, const bool global = true)

  | Parameter | Description |
  |---|---|
  | matrix | the 4x4 matrix to set |
  | global | if true world space will be used, otherwise the entity's local space will be used |
