```csharp
using System;
using UltraEngine;

class Program
{
    static void Main()
    {
        //Get the initial system time
        var starttime = Millisecs();

        //Pause for one second
        Sleep(1000);

        //Show the current time relative to the starting time
        var currenttime = Millisecs() - starttime;
        Print(currenttime);

        //Pause for one second
        Sleep(1000);

        //Show the current time relative to the starting time
        currenttime = Millisecs() - starttime;
        Print(currenttime);
    }
}
```