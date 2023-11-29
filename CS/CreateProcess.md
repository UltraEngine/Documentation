# CreateProcess #
This function launches an external executable and returns a handle that can be used for interaction.

## Syntax ##
- [Process](Process.md) **CreateProcess**(string path, string commandline = "")

### Parameters ###
| Name | Description |
|---|---|
| path | file path of the executable to launch |
| commandline | optional command line to pass to the program |

## Returns ##
If the program was launched a new process is returned, otherwise NULL is returned.

## Example ##

```csharp
using System;
using System.Diagnostics;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Launching process");
        
        Process proc = Process.Start(@"C:\Windows\notepad.exe");
        
        Console.WriteLine("Process running");
        int exitcode = proc.WaitForExit();
        Console.WriteLine("Process ended (" + exitcode + ")");
    }
}
```