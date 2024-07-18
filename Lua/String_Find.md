# Find
This function performs a search for the specified term.

## Syntax 

string **Find**(string s, string token)

| Parameter | Description |
| --- | --- |
| s | the string to search |
| token | the search term to find |

## Returns

Returns the first position in the string where the search term is found, or -1 if it is not found.

## Example

```lua
local s = "Hello, how are you today?"
print(Find(s, "today"))
```
