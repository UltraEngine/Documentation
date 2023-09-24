# Buffer:PokeShort

This method inserts a 16-bit unsigned integer into the memory buffer.

## Syntax

- **PokeShort**(number pos, number n)

Parameter | Description |
---|---
pos | offset from the start of the buffer, in bytes
n | value to insert

## Remarks

A runtime error will occur if the destination range lies outside of the buffer extents.
