# RealPath

This function fixes a file path by adding the complete directory path and replacing backslashes with forward slashes. The file path does not have to specify an existing file.

## Syntax
- [string]([string.md](https://www.lua.org/manual/5.4/manual.html#6.4)) **RealPath**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

| Parameter | Description |
|---|---|
| path | file path to correct |

## Returns
Returns the corrected file path.

## Example

```lua
local path = "..\\./temp.txt";
Print(RealPath(path));
```
