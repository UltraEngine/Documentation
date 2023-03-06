# CreatePackage

This function creates a new package.

## Syntax

- shared_ptr<[Package](Package.md)> **CreatePackage**(const [WString](WString.md) path)

## Returns

Returns a new package if successful, otherwise NULL is returned.

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
