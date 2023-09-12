# string.mid
This function extracts a partial string from a specified position and returns it.

## Syntax
`string.mid(pos, length)`

| Parameter | Description |
| --- | --- |
| pos | The zero-based position in the string to start |
| length | The maximum number of characters to return |

## Returns
Returns a string extracted from the specified position and length.

## Example

```lua
-- Assuming the required libraries are already imported
local s = "Hello, how are you today?"
print(s:mid(7, 3))
```