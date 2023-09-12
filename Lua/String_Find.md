# string.find #
This function performs a search for the specified term.

## Syntax ##
```lua
function **string.find**(str: string, token: string): number
```

## Parameters ##
| Parameter | Description |
| --- | --- |
| str | the string to search |
| token | the search term to find |

## Returns ##
Returns the first position in the string where the search term is found, or -1 if it is not found.

## Example ##
```lua
local s = "Hello, how are you today?"
print(string.find(s, "today"))
```