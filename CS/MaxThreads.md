# MaxThreads #

This function returns the maximum number of simultaneous threads the CPU can execute at once. More threads than this can be created and run, but will not yield any performance gains.

## Syntax ##

- int **MaxThreads**()

## Returns ##

Returns the maximum number of threads that can run at once. 

## Example ##

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main()
    {
        Console.WriteLine(MaxThreads() + " threads are supported on this machine.");
    }
}
```