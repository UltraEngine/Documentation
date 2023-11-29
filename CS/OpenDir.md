# OpenDir #
This function opens a folder in the default system file browser. If a file name is specified, the folder will be opened with that file selected.

## Syntax ##
- bool **OpenDir**(string *path*)

### Parameters ###
| Name | Description |
| --- | --- |
| **path** | folder or file path to show |

## Returns ##
Returns true if the directory was opened successfully, otherwise false is returned.

## Example ##
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        OpenDir(CurrentDir());
    }
}
```