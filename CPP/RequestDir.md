# RequestDir #
This function displays a file dialog and lets the user select a folder.

## Syntax ##
- [WString](WString.md) **RequestDir**(const [WString](WString.md)& title = "Open Folder", const [WString](WString.md)& dir = "");

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString file = RequestDir("Open Folder");
	Print(file);
	return 0;
}
```
