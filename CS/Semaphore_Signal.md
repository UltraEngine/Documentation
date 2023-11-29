# Semaphore.Signal

This method sets the semaphore to the signaled state and releases any threads that are waiting on it.

## Syntax

- void **Signal**()

## Example

```csharp
using System;
using System.Threading;
using UltraEngine;

class Program
{
    static Semaphore semaphore = new Semaphore(0, 1);

    static void EntryPoint(object extra)
    {
        //Cast to Semaphore object
        var semaphore = extra as Semaphore;

        //Wait for signaled state
        semaphore.WaitOne();

        return;
    }

    static void Main(string[] args)
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create a window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], UltraEngine.WINDOW_CENTER | UltraEngine.WINDOW_TITLEBAR);

        //Create a thread
        Thread thread = new Thread(new ParameterizedThreadStart(EntryPoint));
        thread.Start(semaphore);

        while (!window.Closed() && !window.KeyDown(UltraEngine.KEY_ESCAPE))
        {
            //Press space to signal the semaphore
            if (window.KeyHit(UltraEngine.KEY_SPACE))
                semaphore.Release();

            //Detect thread finished
            if (thread.ThreadState == ThreadState.Stopped)
            {
                UltraEngine.Notify("Thread finished!");
                return;
            }

            UltraEngine.Sleep(1);
        }
        return;
    }
}
```
