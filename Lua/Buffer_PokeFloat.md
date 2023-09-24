# Buffer:PokeFloat

This method inserts a 32-bit float value into the memory buffer.

## Syntax

- **PokeFloat**(number pos, number n)

Parameter | Description |
---|---
pos | offset from the start of the buffer, in bytes
n | value to insert

## Remarks

A runtime error will occur if the destination range lies outside of the buffer extents.
