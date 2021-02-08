# Proceed #

This function displays a message dialog box with the options "Yes", "No", and "Cancel".

## Syntax ##
- int **Proceed**(const [WString](WString.md)& message, const [WString](WString.md)& title = "", const bool serious = false)

### Parameters ###
| Name | Description |
| --- | --- |
| message | text for the message dialog box to display |
| title | title for the message dialog box to display |
| serious | if set to true the dialog box will display a warning icon |

## Returns ##
If the user pressed the Yes button 1 is returned. If the user presses the cancel button 0 is returned. If the user presses the No button -1 is returned.

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	Print(Proceed("Do you wish to continue?"));
	return 0;
}
```
