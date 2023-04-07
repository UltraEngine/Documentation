# LoadMaterial

This function loads a material from a file.

## Syntax

- shared_ptr<[Material](Material.md)> **LoadMaterial**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to read from |
| flags | optional load flags |

## Returns

Returns a material object if the file is loaded successfully, otherwise NULL is returned.
