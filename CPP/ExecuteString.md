## Example

This function executes a string of text instead of a file.

## Syntax

- bool **ExecuteString**(const [String](String)& source)

| Parameter | Description |
|---|---|
| source | script code to execute |

## Returns

Returns true if the string was successfully executed, otherwise false is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main()
{
	ExecuteString("Notify('Hello!')");
}
```
