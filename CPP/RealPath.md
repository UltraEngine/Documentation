# RealPath

This function fixes a file path by adding the complete directory path and replacing backslashes with forward slashes. The file path does not have to specify an existing file.

## Syntax
- [WString](WString.md) **RealPath**(const [WString](WString.md)& path)

| Parameter | Description |
|---|---|
| path | file path to correct |

## Returns
Returns the corrected file path.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString path = "..\\./temp.txt";
    Print(RealPath(path));
    return 0;
}
```
