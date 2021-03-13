# CreateStreamBuffer #
This function creates a new StreamBuffer object. A StreamBuffer is a file stream that can be treated like a memory buffer.

## Syntax ##
- shared_ptr<[StreamBuffer](StreamBuffer.md)> **CreateStreamBuffer**(shared_ptr<[Stream](Stream.md)> stream, uint64_t pos, uint64_t size)

## Returns ##
Returns a new StreamBuffer object.
