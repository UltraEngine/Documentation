# FileSize

This method gets the size of a file.

## Syntax

- uint64_t **FileSize**(const [WString](WString.md)& path, const bool packages = true)

| Parameter | Description |
|---|---|
| path | file path to check |
| packages | if set to true all loaded packages will be checked after the file system |

## Returns

Returns the size of the file at the specified path if it exists, otherwise zero is returned.
