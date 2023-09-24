# Buffer:PokeString

This method inserts a string value into the memory buffer.

## Syntax

- **PokeString**(number pos, [string](https://www.lua.org/manual/5.4/manual.html#6.4) s)

Parameter | Description |
---|---
pos | offset from the start of the buffer, in bytes
s | value to insert

## Remarks

A runtime error will occur if the destination range lies outside of the buffer extents.
