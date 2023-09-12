# WString:Lower
This method returns the lowercase version of the wide string.

`WString:Lower()`

## Returns
Returns the string, converted to lowercase.

## Example

```lua
local WString = require("WString")

local s = WString("John Smith")
print(s:Lower())
```
Note: Ensure that the `WString` module has been properly imported into Lua before running the above example.