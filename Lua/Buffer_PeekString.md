# Buffer:PeekString

This method returns a string value from the memory buffer.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4) **PeekString**(number pos)

| Parameter | Description |
| ---- | ----------- |
| pos | offset from the start of the buffer, in bytes |

## Returns

Returns a string value.

## Remarks

A runtime error will occur if the read range lies outside of the buffer extents.

## Example

```lua
local s = "Hello world!"
buffer = CreateBuffer(#s + 1)
buffer:PokeString(0, s)
s = buffer:PeekString(0)
Print(s)
```
