# Rgba

This function combines four 8-bit color channels into a single packed RGBA color.

## Syntax

- unsigned int Rgba(const unsigned char r, const unsigned char g, const unsigned char b, const unsigned char a = 255)

| Parameter | Description |
| --- | --- |
| r | red component |
| g | green component |
| b | blue component |
| a | alpha component |

## Returns

Returns an RGBA color packed into a single integer. The individual color channel values can be extracted with the [Red](Red), [Green](Green.md), [Blue](Blue.md), and [Alpha](Alpha.md) functions.

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
