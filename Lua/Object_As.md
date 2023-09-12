# Object:As

This method casts the object to a derived type.

---
### Syntax

`function As<T>()`

**Parameter**
- T: type to cast to

**Returns**

Returns the object as a derived type T, or `nil` if the object cannot be cast to the specified type.

---
### Remarks

This method should *never* be called in a class constructor or destructor.

---
### Example

```lua
-- Cast to base type
local o = CreateBuffer()

-- Cast to derived type
local buffer = o:As<Buffer>()
```