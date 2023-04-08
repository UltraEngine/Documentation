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

```c++
int main(int argc, const char* argv[])
{
    //Get command-line options
    cl = ParseCommandLine(argc, argv);
    
    //Enable script debugging if the -debug switch is specified
    if (cl["debug"].is_boolean() and cl["debug"] == true)
    {
        RunScript(AppDir() + "/Scripts/Modules/Debugger.lua");
    }

    //Create a timer
    auto timer = CreateTimer(500);
    
    //Poll the debugger every timer tick
    ListenEvent(EVENT_TIMERTICK, timer, std::bind(&PollDebugger, 500))

    //Run the main script
    RunScript(AppDir() + "/Scripts/Main.lua");
    
    return 0
}
```
