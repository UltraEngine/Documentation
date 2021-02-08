# Buffer::PokeFloat #
This method inserts a float value into the memory buffer.

## Syntax ##
- void **PokeFloat**(const uint64_t pos, const float f)

### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **f** | value to insert |

## Remarks ##
A runtime error will occur if the destination range lies outside of the buffer extents.
