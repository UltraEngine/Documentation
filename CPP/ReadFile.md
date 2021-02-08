# ReadFile #
This function loads a file from a path and returns a stream.

## Syntax ##
- shared_ptr<[Stream](CPP_Stream.md)\> **ReadFile**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)

### Parameters ###
|  Name | Descriptio   |
|--|--|
| **path** | file name or URL to load |
| **flags** | optional load settings |

## Returns ##
Returns a new [Stream](CPP_Stream.md) object If the file was successfully read, otherwise NULL is returned.
