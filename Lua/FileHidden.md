# FileHidden

This function returns the hide state of the specified file path.

## Syntax

- **FileHidden**([string](https://www.lua.org/manual/5.4/manual.html#6.4.1) path)

| Parameter | Description |
|---|---|
| path | full or relative |

## Returns

Returns true if the file exists and is hidden, otherwise false is returned.

## Example

```lua
path = CurrentDir()

dir = LoadDir(path)
if (path == "") then
   path = "."
end

for _, file in ipairs(dir) do
   print("Name: " .. file)

   if (path ~= "") then
      file = path .. "/" .. file
   end

   print("Type: " .. FileType(file))
   print("Time: " .. FileTime(file))
   print("Size: " .. FileSize(file))
   print("Hidden: " .. tostring(FileHidden(file)))

   print("")
end
```
