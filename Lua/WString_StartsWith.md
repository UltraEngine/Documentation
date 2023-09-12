# WString:StartsWith

This method compares the beginning of two wide strings.

## Syntax

```lua
function WString:StartsWith(beginning)
```

## Parameters

| Parameter | Description |
|---|---|
| beginning | The string to compare. |

## Returns

Returns true if the left-most characters of this string match the beginning string. Returns false if the strings do not match or if this string is shorter than the beginning string.