# RequestFile #
This function opens a file browser dialog and lets the user select a file to open or save.

## Syntax ##
```csharp
string RequestFile(WString title = "Open File", string file = "", WString filetypes = "All Files:*", int defaulttype = 0, bool save = false);
```

| Parameter | Description |
| ----- | ----- |
| title | Title shown in dialog window. |
| file | Default file directory or full file path. |
| filetypes | File extensions filter. |
| defaulttype | Default file type to show. |
| save | Set to true for a save dialog, otherwise an open dialog will be shown. |

## Returns ##
Returns the selected file path, or an empty string if the user cancelled the operation.

## Remarks ##
The extensions filter allows you to specify one or more file types to show in the dialog. Each file type consists of a description and an extension, separated by a colon. Note that the text shown inside the parenthesis is part of the description, and is just decorative:

```txt
Text Files (*.txt):txt
```

You can specify multiple extensions for a file type by separating them with a comma:

```txt
JPEG Image (*.jpg, *.jpeg):jpg,jpeg
```

You can use a wildcard to specify a range of extensions:

```txt
All Files:*
```

Use a semicolon to specify multiple file extensions for one file type:

```txt
Windows Bitmap (*.bmp):bmp;JPEG Image (*.jpg, *.jprg):jpg,jpeg
```

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/RequestFile.png)

```csharp
using System;

public class Program
{
    public static void Main(string[] args)
    {
        string file = RequestFile("Open File");
        Console.WriteLine(file);
    }
}
```