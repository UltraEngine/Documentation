# ChangeDir

This functions changes the current directory. Relative file paths will loaded from the new directory.

## Syntax

- bool **ChangeDir**(const [WString](WString)& path)

| Parameter | Description |
| --- | --- |
| path | folder location to move to |

## Returns

Returns true if the directory was successfully changed, otherwise false is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Print starting directory
    Print(CurrentDir());

    //Navigate up one directory level
    ChangeDir("..");

    //Print new directory
    Print(CurrentDir());

    return 0;
}
```
