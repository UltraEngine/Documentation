# Package::FileSize

This method returns the size of a file in the archive.

## Syntax

- ulong **FileSize**(string path)

| Parameter | Description |
|---|---|
| path | relative file path |

## Returns

If the file exists, its size will be returned, otherwise zero will be returned.

Example Usage:
```csharp
string filePath = "path/to/file";
ulong fileSize = Package.FileSize(filePath);
Console.WriteLine("File Size: " + fileSize);
```