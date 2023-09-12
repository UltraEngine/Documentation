# WString:Find #
This method performs a search for the specified term in the wide string.

## Syntax ##
- **Find**(token: string): number

## Parameters ##
| Parameter | Description |
| --- | --- |
| token | search term to find |

## Returns ##
Returns the first position in the string where the search term is found, or -1 if it is not found.

## Example

```lua
WString = UltraEngine.WString

s = WString.new("Hello, how are you today?")
print(s:Find("today"))
```