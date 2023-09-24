# Buffer:PeekDouble

This method returns a 64-bit float from the memory buffer.

## Syntax

- number **PeekDouble**(number position)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns

Returns a double float value.

## Remarks

A runtime error will occur if the read range lies outside of the buffer extents.
