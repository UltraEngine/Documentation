# Notify #
This functions displays a message box.

## Syntax ##
- void **Notify**(const [WString](WString)& message, const [WString](WString)& title = "", const bool serious = false)

| Parameter | Description |
| ----- | ----- |
| message | message to display in the message box |
| title | optional title of message box window | 
| serious | If set to true a warning icon will be displayed |

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/Notify.png)

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{ 
	Notify("Hello, world!");
	return 0;
}
```
