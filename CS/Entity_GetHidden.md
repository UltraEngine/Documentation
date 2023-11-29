# Entity.GetHidden

This method can be used to check whether an entity is currently hidden.

## Syntax

```csharp
bool GetHidden(bool recursive = false)
```

| Parameter | Description |
|---|---|
| recursive | if set to true the entity's parent hierarchy will be checked, otherwise only this entity's hide state will be returned |

## Returns

Returns true if the entity is hidden, otherwise false is returned.

## Example

```csharp
// Checking if an entity is hidden
bool isHidden = entity.GetHidden();

// Checking if an entity is hidden recursively
bool isHiddenRecursively = entity.GetHidden(true);
```