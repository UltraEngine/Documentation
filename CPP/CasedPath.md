# CasedPath

This function returns a file path with capitalization fixed to match the existing file on the hard drive. It will also convert backslashes to forward slashes. The specified file must exist.

## Syntax
- [WString](WString.md) **CasedPath**(const [WString](WString.md)& path)

| Parameter | Description |
|---|---|
| path | file path to correct |

## Returns
Returns the file path with corrected capitalization.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString path = CurrentDir();

    //Convert to lowercase
    path = path.Lower();
    Print("Lowercase path: ");
    Print(path);
    Print("");

    //Correct case
    path = CasedPath(path);
    Print("Corrected path: ");
    Print(path);

    return 0;
}
```
