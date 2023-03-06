# Package::FileTime

This method returns the last modification time of a file in the package.

## Syntax

- uint64_t **FileTime**(const [WString](WString.md)& path)

| Parameter | Description |
|---|---|
| path | relative file path |

## Returns

If the file exists its last modification time will be returned, otherwise zero will be returned.
