# Process::GetStatus

This method returns the current status of a running process.

## Syntax 

- ProcessStatus **GetStatus**()

## Returns

Returns the process status. This may be PROCESS_RUNNING or PROCESS_FINISHED. The [Process::Close](Process_Close.md) method should be called to close the handle and retrieve the  exit code once this method returns PROCESS_FINISHED.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

#ifdef _WIN32
WString apppath = "C:/Windows/notepad.exe";
#endif

int main(int argc, const char* argv[])
{
    Print("Launching process");
    auto proc = CreateProcess(apppath);

    Print("Process running");
    while (proc->GetStatus() == PROCESS_RUNNING)
    {
        Sleep(500);
        Print(".");
    }

    int exitcode = proc->Close();

    Print("Process finished (" + String(exitcode) + ")");

    return 0;
}
```
