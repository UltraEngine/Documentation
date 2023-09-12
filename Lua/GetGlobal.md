## **GetGlobal**

### Syntax

```lua
function GetGlobal(name)
```

### Description

This function is used to retrieve the value of a global Lua variable by its name.

### Parameters

- `name` (WString) - The name of the global variable to retrieve.

### Returns

- `object` - The value of the global variable.

### Example

```lua
-- Set a global variable
SetGlobal("testvalue", sol.make_object(L, "Hello"))

-- Run a script that accesses and modifies the variable
ExecuteString("Print(testvalue) testvalue = testvalue..'!'")

-- Retrieve the variable
local o = GetGlobal("testvalue")

-- Cast the result to a string and display
if sol.is_string(o) then
    local s = sol.cast_string(o)
    Print(s)
else
    Print("Variable is not a string.")
end
```