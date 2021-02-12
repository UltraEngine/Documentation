# Buffer::PokeDouble #
This method inserts a double float value into the memory buffer.

## Syntax ##
- void **PokeDouble**(const uint64_t pos, const double f)

### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **f** | value to insert |

## Remarks ##
A runtime error will occur if the destination range lies outside of the buffer extents. Note that a double value is 8 bytes, twice the size of an int or float value.