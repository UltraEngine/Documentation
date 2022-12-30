# WString::Find #
This method performs a search for the specified term in the wide string.

## Syntax ##
- int **Find**(const [WString](WString.md)& token)

| Parameter | Description |
| --- | --- |
| token | search term to find |

## Returns ##
Returns the first position in the string where the search term is found, or -1 if it is not found.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString s = "Hello, how are you today?";
    Print(s.Find("today"));

    return 0;
}
```
