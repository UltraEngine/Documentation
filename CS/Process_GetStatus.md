```csharp
using System;
using System.Diagnostics;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Launching process");
        string apppath = "C:/Windows/notepad.exe";
        Process proc = Process.Start(apppath);

        Console.WriteLine("Process running");
        while (proc.GetStatus() == PROCESS_RUNNING)
        {
            System.Threading.Thread.Sleep(500);
            Console.Write(".");
        }

        int exitcode = proc.Close();

        Console.WriteLine("Process finished (" + exitcode.ToString() + ")");

        Environment.Exit(0);
    }
}
```