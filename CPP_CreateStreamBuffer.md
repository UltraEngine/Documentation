# CreateStreamBuffer #
This function creates a new StreamBuffer object.

## Syntax ##
- shared_ptr<[StreamBuffer](CPP_StreamBuffer.md)> **CreateStreamBuffer**(shared_ptr<[Stream](CPP_Stream.md)> stream, uint64_t pos, uint64_t size)

## Returns ##
Returns a new StreamBuffer object. All [Buffer](CPP_Buffer.md) commands can be used on the object.
