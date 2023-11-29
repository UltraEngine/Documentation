# LoadMaterial

This function loads a material from a file.

## Syntax

```csharp
Material LoadMaterial(string path, LoadFlags flags = LoadFlags.LOAD_DEFAULT);
```

| Parameter | Description |
|---|---|
| path | file path to read from |
| flags | optional load flags |

## Returns

Returns a material object if the file is loaded successfully, otherwise NULL is returned.