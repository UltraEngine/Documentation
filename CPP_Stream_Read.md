# Stream::Read #
This method reads a block of memory from a stream.

## Syntax ##
- uint64_t **Read**(shared_ptr<[Buffer](Buffer.md)> data, const uint64_t offset, const uint64_t size)
- uint64_t **Read**(const void* data, const uint64_t size)

### Parameters ###
| Name | Description |
| --- | --- |
| offset | offset in bytes from memory buffer beginning |
| data | buffer or pointer to write to |
| size | number of bytes to read |

## Returns ##
Returns the number of bytes that were read from the stream.
