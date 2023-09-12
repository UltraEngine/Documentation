# String:Right #
This method returns the rightmost characters of the string.

## Syntax ##
- `Right(count: number): string`

## Parameters ##
| Parameter | Description |
| --- | --- |
| count | Maximum number of characters to return |

## Returns ##
Returns the rightmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example ##
```lua
local s = "Hello, how are you today?"
print(s:Right(6))
```