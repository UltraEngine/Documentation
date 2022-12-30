# WString::Replace #
This method performs a search and replace operation on the wide string and returns the result.

## Syntax ##
- [WString](WString.md) **Replace**(const [WString](WString.md)& searchtext, const [WString](WString)& replacetext)

| Parameter | Description |
| --- | --- |
| searchtext | text to search for |
| replacetext | text to replace with |

## Returns ##
Returns the string with all instances of the search term replaced with the replacement text.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    WString s = "Hello, how are you today?";
    Print(s.Replace("you", "we"));

    return 0;
}
```
