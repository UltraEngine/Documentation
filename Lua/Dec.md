# Dec

This function converts a hexadecimal value into a decimal number and returns the result.

## Syntax

`Dec(hex: string): string`

- `hex` (string): hexadecimal number

## Returns

Returns a string containing the decimal number.

## Example

```lua
-- Assuming UltraEngine has already been imported

local i = 1024
local s = Hex(i)
Print(s)
Print(Dec(s))
```