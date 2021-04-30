# Input
This function waits for a line of text to be input into the program console.

## Syntax
- [WString](WString) **Input**(const [WString](WString)& message)

| Parameter | Description |
| ----- | ----- |
| message | message to print before the input is received. |

## Returns
When the user enters some text and presses enter, the typed input is returned.

## Remarks
On Windows, the project must be built as a console app. In **Configuration Properties > Linker > System** set **SubSystem** to **Console**.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/Input.png)

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString s = Input("Enter your name:");
	Print("You entered \"" + s + "\".");
	return 0;
}
```
