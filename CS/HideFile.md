# HideFile
This function makes the specified file or folder hidden in the file system.

## Syntax
- bool **HideFile**(const [string](https://docs.microsoft.com/en-us/dotnet/api/system.string?view=netcore-3.1)& path)

## Returns
Returns true of the operation was successful or if the file was already hidden, otherwise false is returned.

### Example

#### C++
```cpp
#include <iostream>
#include <Windows.h>
using namespace std;

bool HideFile(const wstring& path)
{
    DWORD attributes = GetFileAttributesW(path.c_str());
    if (attributes == INVALID_FILE_ATTRIBUTES)
    {
        return false;
    }

    attributes |= FILE_ATTRIBUTE_HIDDEN;
    if (!SetFileAttributesW(path.c_str(), attributes))
    {
        return false;
    }

    return true;
}

int main()
{
    wstring filePath = L"C:\\Path\\To\\File.txt";
    if (HideFile(filePath))
    {
        cout << "File successfully hidden." << endl;
    }
    else
    {
        cout << "Failed to hide file." << endl;
    }

    return 0;
}
```

#### C#
```csharp
using System;
using System.IO;

class Program
{
    static bool HideFile(string path)
    {
        try
        {
            FileAttributes attributes = File.GetAttributes(path);
            attributes |= FileAttributes.Hidden;
            File.SetAttributes(path, attributes);
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }
    
    static void Main()
    {
        string filePath = @"C:\Path\To\File.txt";
        if (HideFile(filePath))
        {
            Console.WriteLine("File successfully hidden.");
        }
        else
        {
            Console.WriteLine("Failed to hide file.");
        }
    }
}
```

Note: The C# code equivalent does not provide a way to differentiate between whether the file was already hidden or the operation was successful.