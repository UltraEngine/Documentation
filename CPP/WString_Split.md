# WString::Split

This method splits the wide string by a delimiter and returns an array of parts.

## Syntax

- vector<[WString](WString.md)\> **Split**(const [WString](WString.md)& delimiter)

| Parameters | Description |
|---|---|
| delimiter | string separator |

## Returns
Returns an array of string parts.

## Remarks
If the delimiter is not found in the string, the entire string will be returned. If the delimiter is an empty string, all whitespace characters will be used to split the string.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString s = "dog,cat,raccoon,fox,crow,snake,rabbit,deer";
    vector<WString> sarr = s.Split(",");

    for (auto s : sarr)
    {
        Print(s);
    }

    return 0;
}
```
