# Package:DeleteFile

This function deletes a file from the package.

## Syntax

```lua
DeleteFile(path: [string](https://www.lua.org/manual/5.3/manual.html#3.1))
```

- **path**: relative file path (string)

## Parameters

- **path**: relative file path (string)
- **immediate**: if set to true the package file will be saved immediately, otherwise it will be saved at a later time (boolean, optional)

## Returns

- Returns true if successful, otherwise false is returned (boolean)

## Remarks

Changes will not be made to the package file until the next [Flush](Package_Flush.md) is called or the package is closed.