# Buffer::PeekShort #
This method returns a short integer from the memory buffer.

## Syntax ##
- unsigned short **PeekShort**(const uint64_t pos)
### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
## Returns ##
Returns a short integer value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents.
