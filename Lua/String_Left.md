# Left

This function returns the leftmost characters of the string.

## Syntax

- string **Left**(number count)

| Parameter | Description |
| --- | --- |
| count | maximum number of characters to return |

## Returns

Returns the leftmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example

```lua
local s = "Hello, how are you today?"
Print(Left(s, 5))
```
