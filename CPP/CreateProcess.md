# CreateProcess #
This function launches an external executable and returns a handle that can be used for interaction.

## Syntax ##
- shared_ptr<[Process](Process.md)> **CreateProcess**(const [WString](WString.md)& path, const [WString](WString.md)& commandline = "")

### Parameters ###
| Name | Description |
|---|---|
| path | file path of the executable to launch |
| commandline | optional command line to pass to the program |

## Returns ##
If the program was launched a new process is returned, otherwise NULL is returned.

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
