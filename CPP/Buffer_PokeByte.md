# Buffer::PokeByte #
This method inserts a single byte into a memory buffer.

## Syntax ##
- void **PokeByte**(const uint64_t pos, const unsigned char b)

### Parameters ###
| Name | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |
| b | value to insert |

## Remarks ##
A runtime error will occur if the destination range lies outside of the buffer extents.
