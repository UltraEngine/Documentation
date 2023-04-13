# RunScript

This function executes a Lua script from a file or string.

## Syntax

- bool **RunScript**(const [WString](WString.md)& path)

| Parameter | Description |
|-----|-----|
| path | script file to run |

## Returns

Returns true if the script was successfully run, otherwise false is returned.

## Remarks

This command can run both raw Lua code files (.lua) or compiled Lua byte code (.luac). See the [Lua documentation](https://www.lua.org/manual/5.4/luac.html) for additional information.

## Example

This shows a typical setup for the C++ side of a Lua program.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get command-line options
    auto cl = ParseCommandLine(argc, argv);

    //Enable script debugging if the -debug switch is specified
    if (cl["debug"].is_boolean() and cl["debug"] == true)
    {
        RunScript("Scripts/Modules/Debugger.lua");
    }

    //Create a timer
    auto timer = CreateTimer(490);

    //Poll the debugger every timer tick
    ListenEvent(EVENT_TIMERTICK, timer, std::bind(&PollDebugger, 500));

    //Run the main script
    RunScript("Scripts/Main.lua");

    return 0;
}
```
