```csharp
ShaderFamily LoadShaderFamily(string path, LoadFlags flags = LoadFlags.LOAD_DEFAULT)
```

| Parameter | Description |
|---|---|
| path | file name to load |
| flags | optional load flags |

### Returns

Returns the loaded shader family if successful, otherwise NULL is returned.

Example:

```csharp
ShaderFamily shaderFamily = LoadShaderFamily("shaderFamily.json", LoadFlags.LOAD_DEFAULT);
if (shaderFamily != null)
{
    // do something with the loaded shader family
}
```