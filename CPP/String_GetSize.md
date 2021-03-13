# String::GetSize #
This method returns the number of characters in the string.

## Syntax ##
- int **GetSize**()

## Returns ##
Returns the number of characters in the string.

## Example ##
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    String s = "Hello, how are you today?";
    Print(s.GetSize());

    return 0;
}
```
