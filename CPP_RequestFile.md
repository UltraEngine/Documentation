# RequestFile #
This function opens a file browser dialog and lets the user select a file to open or save.

## Syntax ##
- string **RequestFile**(const string& title = "Open File", const string& file = "", const string& filetypes = "All Files:*", const int typeindex = 0, const bool save = false);
- wstring **RequestFile**(const wstring& title = L"Open File", const wstring& file = L"", const wstring& filetypes = L"All Files:*", const int typeindex = 0, const bool save = false);

| Parameter | Description |
| ----- | ----- |
| title | Title shown in dialog window. |
| file | Default file directory or full file path. |
| filetypes | File extensions filter. |
| typeindex | Default file type to show. |
| save | Set to true for a save dialog, otherwise an open dialog will be shown. |

## Returns ##
Returns the selected file path, or an empty string if the user cancelled the operation.

## Remarks ##
The extensions filter allows you to specify one or more file types to show in the dialog. Each file type consists of a description and an extension, separated by a colon:

```Texture Files (*.txt):txt```

You can specify multiple extensions for a file type by separating them with a comma:

```JPEG Image (*.jpg, *.jpeg):jpg,jpeg```

You can use a wildcard to specify a range of extensions:

```All Files:*```

Use a semicolon to specify multiple file extensions for one file type:

```Windows Bitmap (*.bmp):bmp;JPEG Image (*.jpg, *.jprg):jpg,jpeg```

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
