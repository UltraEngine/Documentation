# LoadShaderFamily

This function loads a shader family from a JSON file.

## Syntax

- shared_ptr<[ShaderFamily](Shaderfamily.md)> **LoadShaderFamily**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file name to load |
| flags | optional load flags |

## Returns

Returns the loaded shader family is successful, otherwise NULL is returned.
