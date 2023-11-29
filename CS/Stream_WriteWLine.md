# Stream.WriteWLine

This method writes a line of wide text to the stream at the current position.

## Syntax

- void **WriteWLine**(string s)

| Parameter | Description |
| --- | --- |
| s | value to write |

## Example

```csharp
using System;
using UltraEngine;

//This example saves a wide string to a UTF-16 encoded text file.

class Program
{
    static void Main(string[] args)
    {
        string path = FileSystem.GetPath(FileSystem.PathType.Documents) + "/temp.txt";
        var stream = FileSystem.WriteFile(path);
        stream.WriteByte(255);
        stream.WriteByte(254);
        stream.WriteWLine("Привет, как ты сегодня?");
        stream.WriteWLine("Я в порядке.");
        stream.Close();

        Process.RunFile(path);
    }
}
```