# Entity::Translate

This method repositions an entity relative to its parent orientation.

## Syntax

- void **Translate**(const [xVec3](xVec3.md)& translation, const bool global = false)
- void **Translate**(const dFloat x, const dFloat y, const dFloat z, const bool global = false)

| Parameter | Description |
|---|---|
| translation, (x, y, z) | movement to apply to the entity |
| global | if set to false movement occurs relative to the parent space, otherwise world space is used |
