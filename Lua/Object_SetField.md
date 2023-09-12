# object:SetField

This method sets a field on the object in the Lua virtual machine.

---

## Syntax

```lua
object:SetField(name, value)
```

### Parameters

- `name` (string): The name of the field to set.
- `value` (any): The value to set for the field.

---

## Example

```lua
-- Create an object
local box = CreateBox(nil)

-- Set a field
box:SetField("health", 100)

-- Retrieve the value
local o = box:GetField("health")
if type(o) == "number" then
    print(o)
end
```

**Output:**

```
100
```