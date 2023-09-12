# WString:trim()

This method removes whitespace characters from the beginning and end of the wide string and returns the result.

## Syntax

```lua
WString:trim()
```

## Returns

Returns the string with whitespace characters removed from the beginning and end.

## Example

```lua
-- Assume the required libraries are already imported

-- Create a WString object
local s = WString("    Hello!  ")

-- Print the trimmed string
print("\"" .. s:trim() .. "\"")
```