# Buffer::PeekInt #
This method returns an integer value from the memory buffer.

## Syntax ##
- int **PeekInt**(const uint64_t pos)
### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
## Returns ##
Returns an integer value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents.
