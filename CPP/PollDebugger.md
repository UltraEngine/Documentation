# PollDebugger

This function periodically polls the script debugger to check for user actions.

## Syntax

- void **PollDebugger**(const int frequency = 500)

| Parameter | Description |
|---|---|
| frequency | maximum frequency of the action, in milliseconds |


## Remarks

For script debugging to work, the debugger must be enabled by running "Scripts/Modules/Debugger.lua".

If you don't periodically call this function, your application will not detect new breakpoints as they are set in the IDE.

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
