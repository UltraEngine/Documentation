# RunFile #
Executes a file with the default system file handler for this file type. This can be used to open an image, text file, or other known file type, or to open a URL in the default web browser.

## Syntax ##
- bool **RunFile**(string path)

### Parameters ###
| Name | Description |
|---|---|
| path | file path to execute |

## Returns ##
Returns true if the file exists and was executed, otherwise false is returned.

## Example ##
```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        RunFile("https://www.ultraengine.com");
    }

    static bool RunFile(string path)
    {
        // implementation
        return true;
    }
}
```