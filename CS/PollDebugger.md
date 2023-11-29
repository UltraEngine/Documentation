# PollDebugger

This function periodically polls the script debugger to check for user actions.

## Syntax

- `void **PollDebugger**(int frequency = 500)`

| Parameter | Description |
|---|---|
| frequency | maximum frequency of the action, in milliseconds |


## Remarks

For script debugging to work, the debugger must be enabled by running "Scripts/Modules/Debugger.lua".

If you don't periodically call this function, your application will not detect new breakpoints as they are set in the IDE.

## Example

This shows a typical setup for the C# side of a Lua program.

```csharp
using System;
using UltraEngine;

public class Program
{
    static void Main(string[] args)
    {
        //Get command-line options
        var cl = ParseCommandLine(args);

        //Enable script debugging if the -debug switch is specified
        if (cl.ContainsKey("debug") && cl["debug"] is bool && (bool)cl["debug"] == true)
        {
            RunScript("Scripts/Modules/Debugger.lua");
        }

        //Create a timer
        var timer = CreateTimer(490);

        //Poll the debugger every timer tick
        ListenEvent(EVENT_TIMERTICK, timer, () => PollDebugger(500));

        //Run the main script
        RunScript("Scripts/Main.lua");
    }
}
```