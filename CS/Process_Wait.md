```csharp
using System;
using System.Diagnostics;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Launching process");
        var proc = Process.Start("C:/Windows/notepad.exe");
        Console.WriteLine("Process running");
        int exitcode = proc.WaitForExit();
        Console.WriteLine("Process ended (" + exitcode.ToString() + ")");
    }
}
```