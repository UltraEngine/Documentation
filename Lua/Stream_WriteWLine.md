# Writing to a Stream: WriteWLine

This function writes a line of wide text to the stream, using the current position as the starting point.
    
## Syntax

```lua
function Stream:WriteWLine(s: WString): void
```
    
- `s` : The wide string to write as a line to the stream.


## Example

```lua
-- This example saves a wide string to a UTF-16 encoded text file.

local path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"
local stream = WriteFile(path)
stream:WriteByte(255)
stream:WriteByte(254)
stream:WriteWLine("Привет, как ты сегодня?")
stream:WriteWLine("Я в порядке.")
stream:Close()

RunFile(path)
```