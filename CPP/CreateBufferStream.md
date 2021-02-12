# CreateBufferStream #

This function creates a new BufferStream object that allows read and writing to a block of memory as if it were a file.

## Syntax ##
- shared_ptr<[BufferStream](BufferStream.md)\> **CreateBufferStream**(shared_ptr<[Buffer](Buffer.md)\> data = NULL, const [WString](WString.md)& path = "")

| Parameter | Description |
| --- | --- |
| **data** | can be used to specify an existing data buffer to use |
| **path** | sets the Stream path member to simulate a file stream |

## Returns ##
Returns a new BufferStream object.
