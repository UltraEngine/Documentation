# Green

Extracts the green component from a packed [RGBA](Rgba.md) value.

## Syntax

- unsigned char **Green**(const unsigned int rgba)

## Returns

Returns the green component of the color.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    int color = Rgba(220,64,128,255);

    Print(Red(color));
    Print(Green(color));
    Print(Blue(color));
    Print(Alpha(color));

    return 0;
}
```
