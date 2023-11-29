# Package::FileType

This method returns the type of a file in the archive.

## Syntax

- int **FileType**(string path)

| Parameter | Description |
|---|---|
| path | relative file path |

## Returns

If the file exists then one or two will be returned for a file or folder, otherwise zero will be returned.

Some package plugins may return three if they support packages-in-packages. This indicates that the file is a package that has already had its contents loaded into the parent package, and it can be treated as a file or a folder.

## Example

```csharp
int fileType = Package.FileType("path/to/file.txt");
Console.WriteLine(fileType);
```