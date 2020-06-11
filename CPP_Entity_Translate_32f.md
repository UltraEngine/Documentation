# Entity::Translate #
This method translates an entity in its parent's space or world space.

## Syntax ##
- void **Translate**(const float x, const float y, const float z, const bool global = false)
- void **Translate**(const [Vec3](CPP_Vec3.md)& translation, const bool global = false)

### Parameters ###
| Name | Description |
| --- | --- |
| **x** | x component of the translation vector |
| **y** | y component of the translation vector |
| **z** | z component of the translation vector |
| **translation** | translation vector |
| **global** | if set to true global space is used, otherwise the entity's parent space is used |
