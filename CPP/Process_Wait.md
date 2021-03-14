# Process::Wait #
This method pauses the calling thread until the process finishes running and exits.

## Syntax ##
- int **Wait**()

## Returns ##
Returns the exit code the process main() function returns.

## Example ##

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Print("Launching process");
    auto proc = CreateProcess("C:/Windows/notepad.exe");
    Print("Process running");
    int exitcode = proc->Wait();
    Print("Process ended (" + String(exitcode) + ")");
    return 0;
}
```
