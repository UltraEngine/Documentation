# RealPath

This function fixes a file path by adding the complete directory path and replacing backslashes with forward slashes. The file path does not have to specify an existing file.

## Syntax
- `WString` **RealPath**(`const WString&` path)

  | Parameter | Description |
  |-----------|-------------|
  | path      | file path to correct |

## Returns
Returns the corrected file path.

## Example

```lua
path = "..\\./temp.txt"
Print(RealPath(path))
```