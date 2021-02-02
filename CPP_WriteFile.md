# WriteFile #
This function creates a new file and returns a stream for write operations.

## Syntax ##
- shared_ptr<[Stream](CPP_Stream.md)\> **WriteFile**(const [WString](WString.md)& path)

| Parameter | Description |
|--|--|
| **path** | file path to save |

## Returns ##
Returns an open stream for write operations if the file was successfully created, otherwise NULL is returned.
