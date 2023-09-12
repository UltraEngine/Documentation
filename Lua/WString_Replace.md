# WString:Replace #
This method performs a search and replace operation on the wide string and returns the result.

## Syntax ##
- WString:Replace(searchtext, replacetext)

### Parameters ###
| Parameter | Description |
| --- | --- |
| searchtext | text to search for |
| replacetext | text to replace with |

## Returns ##
Returns the string with all instances of the search term replaced with the replacement text.

## Example

```lua
s = WString("Hello, how are you today?")
Print(s:Replace("you", "we"))
```