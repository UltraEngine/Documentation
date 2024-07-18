# Mid

This function extracts a partial string from a specified position and returns it.

## Syntax

- string **Mid**(number pos, number length)

| Parameter | Description |
| --- | --- |
| pos | The zero-based position in the string to start |
| length | The maximum number of characters to return |

## Returns
Returns a string extracted from the specified position and length.

## Example

```lua
local s = "Hello, how are you today?"
Print(Mid(s, 7, 3))
```
