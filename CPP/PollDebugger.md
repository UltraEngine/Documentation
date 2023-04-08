# PollDebugger

This function periodically polls the script debugger to check for user actions.

## Syntax

- void **PollDebugger**(const int frequency = 500)

| Parameter | Description |
|---|---|
| frequency | maximum frequency of the action, in milliseconds |


## Remarks

For script debugging to work, the debugger must be enabled by running "Scripts/Modules/Debugger.lua".

## Example

This shows a typical setup for the C++ side of a Lua program.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get command-line options
    auto cl = ParseCommandLine(argc, argv);

    shared_ptr<Timer> debugtimer;// Declare this outside the if block so it doesn't get deleted
    
    //Enable script debugging if the -debug switch is specified
    if (cl["debug"].is_boolean() and cl["debug"] == true)
    {
        //Enable Lua debugging
        RunScript("Scripts/Modules/Debugger.lua");
        
        //Create a timer
        debugtimer = CreateTimer(500);

        //Poll the debugger every timer tick
        ListenEvent(EVENT_TIMERTICK, debugtimer, std::bind(&PollDebugger, 490));
    }

    //Run the main script
    RunScript("Scripts/Main.lua");

    return 0;
}
```
