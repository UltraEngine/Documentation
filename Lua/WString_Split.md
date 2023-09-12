# WString:Split

This method splits the wide string by a delimiter and returns an array of parts.

## Syntax

`function WString:Split(delimiter: string) -> table`

### Parameters

- `delimiter: string`: string separator

### Returns

Returns an array of string parts.

## Remarks

If the delimiter is not found in the string, the entire string will be returned. If the delimiter is an empty string, all whitespace characters will be used to split the string.

## Example

```lua
local UltraEngine = require("UltraEngine")

local s = UltraEngine.WString("dog,cat,raccoon,fox,crow,snake,rabbit,deer")
local sarr = s:Split(",")

for i, s in ipairs(sarr) do
    UltraEngine.Print(s)
end
```