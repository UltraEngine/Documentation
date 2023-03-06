# Package::DeleteFile

This method deletes a file from the package.

## Syntax

bool **DeleteFile**(const [WString](WString.md) path, const bool immediate = false)

| Parameter | Description |
|---|---|
| path | relative file path |
| immediate | if set to true the package file will be saved immediately, otherwise it will be saved at a later time |

## Returns

Returns true if successful, otherwise false is returned.

## Remarks

Changes will not be made to the package file until the next [Flush](Package_Flush.md) is called or the package is closed.
