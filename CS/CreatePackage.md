# CreatePackage

This function creates a new package.

## Syntax

- `Package` **CreatePackage**(string path)

## Returns

Returns a new package if successful, otherwise NULL is returned.

## Example

```csharp
using UltraEngine;

static void Main(string[] args)
{
    // Create a new zip package
    var pak = CreatePackage("test.zip");
    
    // Create a stream
    var stream = CreateBufferStream();
    
    // Write a line of text
    stream.WriteLine("Hello!");
    
    // Insert the stream contents into the package
    pak.AddFile("test.txt", stream.data);
    
    // Close the stream
    stream.Close();
    
    // Close the package to finalize changes
    pak.Close();
    
    // Open the zip file in the default program
    RunFile("test.zip");
}
```