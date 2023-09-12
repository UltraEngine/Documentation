# String:Split
This function splits the string by a delimiter and returns an array of parts.

## Syntax

`function String:Split(delimiter: string) -> table`

## Parameters

- `delimiter` (string): The separator used to split the string.

## Returns

Returns an array of string parts.

## Remarks

If the delimiter is not found in the string, the entire string will be returned. If the delimiter is an empty string, all whitespace characters will be used to split the string.

## Example

```lua
local s = "dog,cat,raccoon,fox,crow,snake,rabbit,deer"
local sarr = s:Split(",")

for _, s in ipairs(sarr) do
    print(s)
end
```