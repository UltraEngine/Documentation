# RequestFile #
This function opens a file browser dialog and lets the user select a file to open or save.

## Syntax ##
- string **RequestFile**(const string& title = "Open File", const string& file = "", const string& extensions = "All Files:*", const int extindex = 0, const bool save = false);
- wstring **RequestFile**(const wstring& title = L"Open File", const wstring& file = L"", const wstring& extensions = L"All Files:*", const int extindex = 0, const bool save = false);

| Parameter | Description |
| ----- | ----- |
| title | Title shown in dialog window. |
| file | Default file directory or full file path. |
| extensions | File extensions filter. |
| extindex |  |
| save | |

## Returns ##
Returns the selected file path, or an empty string if the user cancelled the operation.

## Example ##

```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	string file = RequestFile("Open File");
	Print(file);
	return 0;
}
```
