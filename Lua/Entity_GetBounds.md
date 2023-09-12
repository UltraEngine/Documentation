# Entity.GetBounds

This method retrieves the entity bounding box.

## Syntax

```lua
function Entity:GetBounds(mode)
```

### Parameters

- `mode` (optional) - type of bounds to retrieve, can be `BOUNDS_LOCAL`, `BOUNDS_GLOBAL`, or `BOUNDS_RECURSIVE`

## Returns

Returns the specified entity bounding box.

## Example

```lua
local bounds = Entity:GetBounds(BOUNDS_GLOBAL)
```
**Note:** The `BOUNDS_GLOBAL` value is assumed to be already defined.