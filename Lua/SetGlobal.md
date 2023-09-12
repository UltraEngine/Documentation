# SetGlobal

## Syntax

```lua
SetGlobal(name, value)
```

Sets a global variable in the Lua state.

### Parameters

- `name` (string): The name of the global variable.
- `value` (any): The value to assign to the global variable.

## Example

```lua
-- Set a global variable
SetGlobal("testvalue", "Hello")

-- Run a script that accesses and modifies the variable
ExecuteString("Print(testvalue) testvalue = testvalue..'!'")

-- Retrieve the variable
local o = GetGlobal("testvalue")

-- Check if the variable is a string and display its value
if type(o) == "string" then
    Print(o)
else
    Print("Variable is not a string.")
end
```