# stream:write_wstring

This method writes a wide string to the stream at the current position.

## Syntax

```lua
function stream:write_wstring(s: wstring, terminate: boolean = true)
```

### Parameters

- `s` (wstring): string to write
- `terminate` (boolean): if true an extra short with a value of zero will be written at the end of the string

## Example

```lua
-- This example saves a wide string to a UTF-16 encoded text file.

local s = L"Привет, как ты сегодня? Я в порядке."

local path = GetPath(PATH_DOCUMENTS) + "/temp.txt"
local stream = WriteFile(path)
stream:write_byte(255)
stream:write_byte(254)
stream:write_wstring(s, false)
stream:close()

RunFile(path)
```