# LoadTable

This function loads a C# table from a JSON file or open stream.

## Syntax

- [Table](https://github.com/UltraEngine/tableplusplus#programming-guide) **LoadTable**(string path)
- [Table](https://github.com/UltraEngine/tableplusplus#programming-guide) **LoadTable**(Stream stream)

| Parameter | Description |
|---|---|
| path | file path to load |
| stream | stream to read from |

## Returns

This function always returns a table, but the returned table may be equal to null if it was not loaded successfully.

## Example

```csharp
Table table = LoadTable("path/to/file.json");
```

or

```csharp
Stream stream = OpenStream("path/to/file.json");
Table table = LoadTable(stream);
```