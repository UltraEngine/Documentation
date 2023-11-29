# GetPath

This function returns a system path.

## Syntax

string **GetPath**(UserPath path);

| Parameter | Description |
|---|---|
| path | indicates which system path to retrieve, can be PATH_DESKTOP, PATH_DOCUMENTS, or PATH_PROGRAMDATA. |

## Returns

Returns a string containing a file path.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine(GetPath(UserPath.PATH_DESKTOP));
        Console.WriteLine(GetPath(UserPath.PATH_DOCUMENTS));
        Console.WriteLine(GetPath(UserPath.PATH_PROGRAMDATA));
    }
}      
```