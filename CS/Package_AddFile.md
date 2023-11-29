## Package::AddFile

This method writes a new file to a package.

### Syntax

- bool **AddFile**(string path, SharedPtr<[Buffer](Buffer.md)\> data, bool immediate = false)

| Parameter | Description |
|---|---|
| path | relative file path |
| data | file contents |
| immediate | if set to true the package file will be immediately saved, otherwise it will be saved automatically later |

### Returns

Returns true if successful, otherwise false is returned.

If the package is closed, false will be returned.

If the package was loaded with a plugin that does not support writing, false will be returned.

### Example

```csharp
using System;
using UltraEngine;

class Game
{
    static void Main(string[] args)
    {
        // Create a new zip package
        var pak = Package.CreatePackage("test.zip");

        // Create a stream
        var stream = new BufferStream();

        // Write a line of text
        stream.WriteLine("Hello!");

        // Insert the stream contents into the package
        pak.AddFile("test.txt", stream.data);

        // Close the stream
        stream.Close();

        // Close the package to finalize changes
        pak.Close();

        // Open the zip file in the default program
        UltraEngine.RunFile("test.zip");
    }
}
```