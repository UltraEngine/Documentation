# RunScript

This function executes a Lua script from a file or string.

## Syntax

```csharp
bool RunScript(string path)
```

| Parameter | Description |
|-----|-----|
| path | script file to run |

## Returns

Returns true if the script was successfully run, otherwise false is returned.

## Remarks

This command can run both raw Lua code files (.lua) or compiled Lua byte code (.luac). See the [Lua documentation](https://www.lua.org/manual/5.4/luac.html) for additional information.

A build of the luac compiler is included in the "Tools" folder of the Ultra Engine install directory.

## Example

This shows a typical setup for the C# side of a Lua program.

```csharp
using System;
using UltraEngine;

class Program
{
    static void ExecuteDir(string path)
    {
        var dir = LoadDir(path);
        foreach (var file in dir)
        {
            string filepath = path + "/" + file;
            switch (FileType(filepath))
            {
                case 1:
                    if (ExtractExt(file).ToLower() == "lua")  RunScript(filepath);
                    break;
                case 2:
                    ExecuteDir(filepath);
                    break;
            }
        }
    }

    static void Main(string[] args)
    {
        // Get commandline settings
        var settings = ParseCommandLine(args);

        // Run the error handler script
        RunScript("Scripts/System/ErrorHandler.lua");

        // Enable the debugger if needed
        Timer debugtimer;
        if (settings["debug"].IsBoolean() && settings["debug"].Equals(true))
        {
            RunScript("Scripts/System/Debugger.lua");
            debugtimer = CreateTimer(510);
            ListenEvent(EVENT_TIMERTICK, debugtimer, () => PollDebugger(500));
        }

        // Enable the entity component system
        RunScript("Scripts/System/ComponentSystem.lua");

        // Run user start scripts
        ExecuteDir("Scripts/Start");

        // Run main script
        RunScript("Scripts/Main.lua");
    }
}
```