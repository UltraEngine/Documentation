# ReadFile #
This function loads a file from a path and returns a stream.

## Syntax ##
`ReadFile(path: string, flags: number): Stream`

### Parameters ###
|  Name | Descriptio   |
|--|--|
| **path** | file name or URL to load |
| **flags** | optional load settings |

## Returns ##
Returns a new `Stream` object If the file was successfully read, otherwise `nil` is returned.

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"

-- Write a new file
stream = WriteFile(path)
if stream == nil then
    print("Failed to write file.")
    return 0
end

stream:WriteLine("Hello, world!")
stream:Close()

stream = ReadFile(path)
print(stream:ReadLine())
```