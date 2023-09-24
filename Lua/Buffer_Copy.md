# Buffer:Copy

This method copies the contents of this buffer to another one.

## Syntax

- **Copy**(number srcoffset, [Buffer](Buffer.md) dst, number dstoffset, number size)

| Parameter | Description |
| ----- | ----- |
| srcoffset | offset for the source buffer data, in bytes |
| dst | destination buffer |
| dstoffset | offset for the destination buffer data, in bytes | 
| size | number of bytes to copy |

## Remarks

A runtime error will occur if the source or destination range lies outside of the buffer extents.
