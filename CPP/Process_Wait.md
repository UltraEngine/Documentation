# Process::Wait #

This method pauses the calling thread until the process finishes running and exits.

## Syntax ##

- int **Wait**()

## Returns ##

Returns the process exit code.

## Remarks ##
This method will close the handle to the finished process. You do not need to call [Process::Close](Process_Close.md) after calling this method.

## Example ##

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Print("Launching process");
#ifdef _WIN32
    auto proc = CreateProcess("C:/Windows/notepad.exe");
#endif
    Print("Process running");
    int exitcode = proc->Wait();
    Print("Process ended (" + String(exitcode) + ")");
    return 0;
}
```
