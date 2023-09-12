# CallMethod

This function performs a method-style function call with any object.

**Syntax**

- `sol.object CallMethod(shared_ptr<T> o, const WString& name, const std::vector<sol.object>& args = {})`
- `bool CallMethod(shared_ptr<T> o, const WString& name, const std::vector<sol.object>& args, std::vector<sol.object>& returnvalues)`

**Parameter Description**

| Parameter | Description |
|---|---|
| `o` | object to call the method for, must be derived from `Object` |
| `name` | name of the method |
| `args` | method arguments |
| `returnvalues` | return values will be stored here |

**Returns**

The first overload returns a single return value.

The second overload returns true if the method was successfully executed, otherwise false is returned.

**Remarks**

When `CallMethod` is used, the object passed to the function will be the first function argument. The function must be declared in Lua preceded by ":", enabling the self keyword to be used.

```lua
function player:SetHealth( health )
    -- Function body
end
```

The function will be identified by name, so it must be a field of the userdata object passed to the `CallMethod` function.

**Syntax**

```lua
entity = CreateBox()
entity.name = "Bob"
SetGlobal("entity", entity)
ExecuteString("function entity:Rename( newname ) self.name = newname end")
CallMethod(entity, "Rename", { "Fred" })
Print(entity.name)
```

Here is a Lua example that demonstrates the usage of `CallMethod` function:

```lua
-- Create an object
entity = CreateBox()
entity.name = "Bob"

-- Declare a variable in Lua
SetGlobal("entity", entity)

-- Run a script that attaches a function to the entity
ExecuteString("function entity:Rename( newname ) self.name = newname end")

-- Call the method
CallMethod(entity, "Rename", { "Fred" })

-- Check if it worked
Print(entity.name)
```