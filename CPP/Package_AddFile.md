# Package::AddFile

This method writes a new file to a package.

## Syntax

- bool **AddFile**(const [WString](WString.md)& path, shared_ptr<[Buffer](Buffer.md)\> data, const bool immediate = false)

| Parameter | Description |
|---|---|
| path | relative file path |
| data | file contents |
| immediate | if set to true the package file will be immediately save, otherwise it will be saved automatically later |

## Returns

Returns a true if successful, otherwise false is returned.

If the package is closed false will be returned.

If the package was loaded with a plugin that does not support writing then false will be returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

void main(int argc, const char* argv[])
{
    // Create a new zip package
    auto pak = CreatePackage("test.zip");
    
    // Create a stream
    auto stream = CreateBufferStream();
    
    // Write a line of text
    stream->WriteLine("Hello!");
    
    // Insert the stream contents into the package
    pak->AddFile("test.txt", stream->data);
    
    // Close the stream
    stream->Close();
    
    // Close the package to finalize changes
    pak->Close();
    
    // Open the zip file in the default program
    RunFile("test.zip");
}
```
