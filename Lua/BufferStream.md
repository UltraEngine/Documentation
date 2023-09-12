# BufferStream

This class provides a mechanism to read from and write to a block of memory as if it were a file.

Base class: [Stream](Stream.md)

## Properties

### CreateBufferStream

```lua
function CreateBufferStream(buffer: string): BufferStream
```

Creates a new BufferStream object.

#### Parameters

- `buffer` (string): The initial content of the buffer.

#### Returns

- `BufferStream`: The newly created BufferStream object.