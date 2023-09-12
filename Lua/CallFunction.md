# CallFunction

This command executes a Lua function call.

## Syntax

- CallFunction(**name**: string, **args**: table) -> [varargs](https://www.lua.org/manual/5.3/manual.html#3.4.7)
- CallFunction(**name**: string, **args**: table, **results**: table) -> bool
- CallFunction(**func**: function, **args**: table, **results**: table) -> bool

## Example

```lua
-- Function for showing return values
function DisplayReturnValue(val)
    if not val then return end
    if type(val) == "boolean" then
        print(tostring(val))
    elseif type(val) == "number" then
        print(val)
    elseif type(val) == "string" then
        print(val)
    else
        print("Unknown type")
    end
end

-- Run a script that declares a function
ExecuteString("function MyFunc( a, b ) return a + b end")

-------------------------------------------------------------------------------------------
-- First, call function the easy way
-------------------------------------------------------------------------------------------

local result = CallFunction("MyFunc", { 3, 2 })

--Print the result
DisplayReturnValue(result)

-------------------------------------------------------------------------------------------
-- Now, call function the advanced way - Handles multiple return values and function errors
-------------------------------------------------------------------------------------------

--Store return values
local returnvalues = {}

--Execute the function
if CallFunction("MyFunc", { 3, 2 }, returnvalues) then
    print(tostring(#returnvalues) .. " return values")

    --Get the return values
    for _, val in ipairs(returnvalues) do
        DisplayReturnValue(val)
    end
else
    print("Failed to call function")
end
```