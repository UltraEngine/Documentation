# Buffer:PeekShort

This method returns a 16-bit unsigned short integer from the memory buffer.

## Syntax

- number **PeekShort**(number position)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns

Returns a short value.

## Remarks

A runtime error will occur if the read range lies outside of the buffer extents.
