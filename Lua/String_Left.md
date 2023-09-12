# string.Left #
This function returns the leftmost characters of the string.

## Syntax ##
- [string](string.md) **Left**(count: number)

| Parameter | Description |
| --- | --- |
| count | maximum number of characters to return |

## Returns ##
Returns the leftmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example ##
```lua
local s = "Hello, how are you today?"
print(string.Left(s, 5))
```