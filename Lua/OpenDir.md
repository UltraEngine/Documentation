# OpenDir #
This function opens a folder in the default system file browser. If a file name is specified, the folder will be opened with that file selected.

## Syntax ##
- **OpenDir**(path: [string](https://www.lua.org/manual/5.3/manual.html#6.4.1))

### Parameters ###
| Name | Description |
| --- | --- |
| **path** | folder or file path to show |

## Returns ##
Returns true if the directory was opened successfully, otherwise false is returned.

## Example ##
```lua
function main()
    OpenDir(CurrentDir())
end

main()
```