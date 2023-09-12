# Entity:UpdateBounds

This function recalculates the entity bounding boxes.

## Syntax

```lua
function Entity:UpdateBounds(mode)
```

## Parameters

- `mode` (optional): bounds update mode, can be `BOUNDS_ALL` or any combination of `BOUNDS_LOCAL`, `BOUNDS_GLOBAL`, and `BOUNDS_RECURSIVE`

## Example

```lua
-- Recalculate entity bounding boxes for all modes
entity:UpdateBounds()

-- Recalculate entity bounding boxes for the BOUNDS_LOCAL mode
entity:UpdateBounds(BOUNDS_LOCAL)

-- Recalculate entity bounding boxes for the BOUNDS_GLOBAL mode
entity:UpdateBounds(BOUNDS_GLOBAL)

-- Recalculate entity bounding boxes for the BOUNDS_RECURSIVE mode
entity:UpdateBounds(BOUNDS_RECURSIVE)

-- Recalculate entity bounding boxes for multiple modes
entity:UpdateBounds(BOUNDS_LOCAL | BOUNDS_GLOBAL)

-- Recalculate entity bounding boxes for all modes, excluding BOUNDS_RECURSIVE
entity:UpdateBounds(BOUNDS_ALL & ~BOUNDS_RECURSIVE)
```

The `UpdateBounds` function can be called with an optional mode parameter. If the `mode` parameter is not specified, the function will recalculate the entity bounding boxes for all modes. 
Otherwise, the function will only recalculate the entity bounding boxes for the specified modes.