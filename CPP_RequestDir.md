# RequestDir #
This function displays a file dialog and lets the user select a folder.

## Syntax ##
- string RequestDir(const string& title = "Open Folder", const string& dir = "");
- wstring RequestDir(const wstring& title = L"Open Folder", const wstring& dir = L"");

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	string file = RequestDir("Open Folder");
	Print(file);
	return 0;
}
```
