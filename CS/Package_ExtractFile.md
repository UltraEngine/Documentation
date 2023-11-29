# Package.ExtractFile

This method extracts a single file from the package.

## Syntax

- **bool ExtractFile**(string path, string dest)

| Parameter | Description |
|---|---|
| path | relative file path |
| dest | file to save |

## Returns

Returns true if the file is successfully extracted, otherwise false is returned.

## Example

```csharp
string path = "example.package";
string dest = "example.txt";

bool success = Package.ExtractFile(path, dest);
if (success)
{
    Console.WriteLine("File extracted successfully.");
}
else
{
    Console.WriteLine("Failed to extract file.");
}
```