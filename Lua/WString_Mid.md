# WString:Mid #
This function extracts a partial wide string and returns it.

## Syntax ##
- WString:Mid(pos, length)

### Parameters ###
- pos: a zero-based position in the string to start
- length: the maximum number of characters to return

### Returns ###
Returns a string extracted from the specified position and length.

## Example

```lua
local s = WString("Hello, how are you today?")
Print(s:Mid(7, 3))
```