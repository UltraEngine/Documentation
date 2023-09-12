# string.trim #

This method removes whitespace characters from the beginning and end of the string and returns the result.

#### Syntax ####

- string:trim()

#### Returns ####

Returns the string with whitespace characters removed from the beginning and end.

#### Example ####

```lua
local s = "    Hello!  "
print('"' .. s:trim() .. '"')
```