# Package::ReadFile

This method reads a file from the archive.

## Syntax

- [Stream](Stream.md) **ReadFile**(string path)

| Parameter | Description |
|---|---|
| path | relative file path |

## Returns

Returns a new stream if the file exists, otherwise `null` will be returned.

## Example

```csharp
Stream ReadFile(string path)
{
    // Implementation goes here
}
```