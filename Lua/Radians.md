# Radians

This function converts an angle from degrees to radians.

## Syntax

- `local `**`radians`**`(angle: number): number`

| Parameter | Description |
| --- | --- |
| angle | angle in degrees |

## Returns

Returns the angle, converted to radians.

## Example

```lua
-- This example requires the UltraEngine library

-- Convert angle from degrees to radians
local a = 45
local r = radians(a)
print(r)

-- Convert angle from radians to degrees
print(degrees(r))
```