# Package::DeleteFile

This method deletes a file from the package.

## Syntax

bool **DeleteFile**(const [WString](WString.md) path)

| Parameter | Description |
|---|---|
| path | relative file path |

## Returns

Returns true if successful, otherwise false is returned.

## Remarks

Changes will not be made to the package file until the next [Flush](Package_Flush.md) is called or the package is closed.
