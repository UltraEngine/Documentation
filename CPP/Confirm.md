# Confirm #

This function displays a message dialog box with the options "OK" and "Cancel".

## Syntax ##
- int **Confirm**(const [WString](WString.md)& message, const [WString](WString.md)& title = "", const bool serious = false)

### Parameters ###
| Name | Description |
| --- | --- |
| message | text for the message dialog box to display |
| title | title for the message dialog box to display |
| serious | if set to true the dialog box will display a warning icon |

## Returns ##
If the user pressed the OK button 1 is returned. If the user presses the cancel button 0 is returned.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/Confirm.png)

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	Print(Confirm("Are you sure you want to do that?"));
	return 0;
}
```
