# String::Find #
This method performs a search for the specified term.

## SEyntax ##
- int **Find**(const [String](String.md)& token)

| Parameter | Description |
| --- | --- |
| token | search term to find |

## Returns ##
Returns the first position in the string where the search term is found, or -1 if it is not found.

## Example ##
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    String s = "Hello, how are you today?";
    Print(s.Find("today"));

    return 0;
}
```
