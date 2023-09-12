# Object:GetField

This method gets a field on the object in the Lua virtual machine.

## Syntax

```lua
function Object:GetField(name: string) -> sol.object
```

## Example

```lua
--Get the sol state
local lua = GetLuaState()

--Get the Lua state
local L = lua.lua_state()

--Create an object
local box = CreateBox(nil)

--Set a field
box:SetField("health", 100)

--Retrieve the value
local o = box:GetField("health")
if o:is<double>() then
    Print(o:as<double>())
end
```