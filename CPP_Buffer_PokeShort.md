# Buffer::PokeShort #
This method inserts a single short integer into a memory buffer.

## Syntax ##
- void **PokeShort**(const uint64_t pos, const unsigned short i)

### Parameters ###
| Name | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **i** | value to insert |

## Remarks ##
A runtime error will occur if the destination range lies outside of the buffer extents.
