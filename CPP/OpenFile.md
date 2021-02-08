# OpenFile #
This function opens a file and returns a stream for read and write operations.

## Syntax ##
- shared_ptr<[Stream](CPP_Stream.md)\> **OpenFile**(const [WString](WString.md)& path)

| Parameter | Description |
|--|--|
| **path** | file path to open |

## Returns ##
Returns an open stream for read and write operations if the file was successfully created, otherwise NULL is returned.
