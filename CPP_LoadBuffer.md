# LoadBuffer #
This function loads a buffer from a file.

## Syntax ##
- shared_ptr<[Buffer](CPP_Buffer.md)\> **LoadBuffer**(const string& path, const [LoadFlags](CPP_Constants.md) flags = LOAD_DEFAULT)
- shared_ptr<[Buffer](CPP_Buffer.md)\> **LoadBuffer**(const wstring& path, const [LoadFlags](CPP_Constants.md) flags = LOAD_DEFAULT)

### Parameters ###
| Name | Description |
| ----- | ----- |
| **path** | file name to load |
| **flags** | optional load settings |

## Returns ##
Returns the loaded buffer if successful, otherwise NULL is returned.
