# Package::FileSize

This method returns the size of a file in the archive.

## Syntax

- uint64_t **FileSize**(const [WString](WString.md)& path)

| Parameter | Description |
|---|---|
| path | relative file path |

## Returns

If the file exists its size will be returned, otherwise zero will be returned.
