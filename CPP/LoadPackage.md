# LoadPackage

This function loads a package from an archive file.

## Syntax

- shared_ptr<[Package](Package.md)\> **LoadPackage**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load |
| flags | optional load flags |

## Returns

Returns a new package if it was successfully loaded, otherwise NULL is returned.
