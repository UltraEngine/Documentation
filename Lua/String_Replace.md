# String:Replace #
This method performs a search and replace operation on the string and returns the result.

## Syntax ##
- **String:Replace**(searchtext, replacetext)

| Parameter | Description |
| --- | --- |
| searchtext | text to search for |
| replacetext | text to replace with |

## Returns ##
Returns the string with all instances of the search term replaced with the replacement text.

## Example

```lua
local s = "Hello, how are you today?"
print(s:Replace("you", "we"))
```