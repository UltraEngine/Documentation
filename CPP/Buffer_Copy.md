# Buffer::Copy #
This method copies the contents of this buffer to another one.

## Syntax ##
- void **Copy**(const uint64_t srcoffset, shared_ptr<Buffer> dst, const uint64_t dstoffset, const uint64_t size)

### Parameters ###
| Name | Description |
| ----- | ----- |
| srcoffset | offset for the source buffer data, in bytes |
| dst | destination buffer |
| dstoffset | offset for the destination buffer data, in bytes | 
| size | number of bytes to copy |

## Remarks ##
A runtime error will occur if the source or destination range lies outside of the buffer extents.