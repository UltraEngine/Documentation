# String:StartsWith

This method compares the beginning of two strings.

## Syntax

```lua
function **String:StartsWith**(beginning: string): boolean
```

## Parameters

- `beginning`: A string to compare.

## Returns

- Returns true if the left-most characters of this string match the beginning string.
- Returns false if the strings do not match, or if this string is shorter than the beginning string.