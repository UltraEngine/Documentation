# Split

This function splits the string by a delimiter and returns an array of parts.

## Syntax

string **Split**(string delimiter)

| Parameter | Description |
|---|---|
| delimiter | the separator used to split the string |

## Returns

Returns an array of string parts.

## Remarks

If the delimiter is not found in the string, the entire string will be returned. If the delimiter is an empty string, all whitespace characters will be used to split the string.

## Example

```lua
local s = "dog,cat,raccoon,fox,crow,snake,rabbit,deer"
local sarr = Split(s, ",")

for _, s in ipairs(sarr) do
    Print(s)
end
```
