# Package::WriteFile

This method writes a new file to a package.

## Syntax

- shared_ptr<[Stream](Stream.md)\> **WriteFile**(const [WString](WString.md)& path)

| Parameter | Description |
|---|---|
| path | relative file path |

## Returns

Returns a new stream if successful, otherwise NULL is returned.

If the package is closed NULL will be returned.

If the package was loaded with a plugin that does not support writing then NULL will be returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

void main(int argc, const char* argv[])
{
    // Create a new zip package
    auto pak = CreatePackage("test.zip");
    
    // Write a file into the package
    auto stream = pak->WriteFile("test.txt");
    
    // Write a line of text
    stream->WriteLine("Hello!");
    
    // Close the stream
    stream->Close();
    
    // Close the package to finalize changes
    pak->Close();
    
    // Open the zip file in the default program
    RunFile("test.zip");
}
```
