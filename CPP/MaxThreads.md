# MaxThreads #

This function returns the maximum number of simultaneous threads the CPU can execute at once. More threads than this can be created and run, but will not yield any performance gains.

## Syntax ##

- int **MaxThreads**()

## Returns ##

Returns the maximum number of threads that can run at once. 

## Example ##

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Print(String(MaxThreads()) + " threads are supported on this machine.");
    return 0;
}
```
