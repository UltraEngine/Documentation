# light.SetRange

This method sets the distance to which the light illuminates.

## Syntax

- `light.SetRange(nearrange, farrange)`
- `light.SetRange(farrange)`

## Parameters

| Parameter | Description |
|---|---|
| `nearrange` | near range used for shadow map rendering |
| `farrange` | the maximum distance the light can reach |

## Remarks

Point and spot lights should use a near and far range above zero.

Box lights can have a negative near range, to make light appear behind the light position.

## Example

```lua
-- Set range for a light
light:SetRange(nearrange, farrange)

-- Set range for a light without specifying near range
light:SetRange(farrange)
```