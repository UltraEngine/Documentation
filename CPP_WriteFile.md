# WriteFile #
This function creates a new file and returns a stream for write operations.

## Syntax ##
- shared_ptr<[Stream](CPP_Stream.md)\> **WriteFile**(const string& path)
- shared_ptr<[Stream](CPP_Stream.md)\> **WriteFile**(const wstring& path)

### Parameters ###
|  |  |
|--|--|
| **path** | file path to save |

## Returns ##
Returns an open stream for write operations if the file was successfully created, otherwise NULL is returned.
