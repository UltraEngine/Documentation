# PokeWString #
This method inserts a wide string into a memory buffer.

## Syntax
```
PokeString(pos, s)
```

### Parameters
- **pos**: offset from the start of the buffer, in bytes
- **s**: value to insert

## Remarks
The buffer must have enough space to store the string plus an extra NULL short value. A runtime error will occur if the destination range lies outside of the buffer extents.

## Example

```lua
require "UltraEngine"

s = WString("Hello, how are you today?")
buffer = CreateBuffer((s:GetSize() + 1) * sizeof(s[0]))
buffer:PokeWString(0, s)
Print(buffer:PeekWString(0))
```