# CasedPath

This function returns a file path with capitalization fixed to match the existing file on the hard drive. It will also convert backslashes to forward slashes. The specified file must exist.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4) **CasedPath**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

| Parameter | Description |
| path | the file path to use |

## Returns
Returns the file path with corrected capitalization.

## Example

```lua
local path = CurrentDir()

-- Convert to lowercase
path = path:Lower()
Print("Lowercase path: ")
Print(path)
Print("")

-- Correct case
path = CasedPath(path)
Print("Corrected path: ")
Print(path)
```
