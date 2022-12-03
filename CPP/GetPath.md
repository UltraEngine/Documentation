# GetPath

This function returns a system path.

## SyntaX

WString **GetPath**(const UserPath path)

| Parameter | Description |
|---|---|
| path | indicates which system path to retrieve, can be PATH_DESKTOP, PATH_DOCUMENTS, or PATH_PROGRAMDATA. |

## Returns

Returns a string containing a file path.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Print(GetPath(PATH_DESKTOP));
    Print(GetPath(PATH_DOCUMENTS));
    Print(GetPath(PATH_PROGRAMDATA));
    return 0;
}      
```   
