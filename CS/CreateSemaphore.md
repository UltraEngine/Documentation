# CreateSemaphore

This function creates a semaphore object which can be signaled by one thread and waited on by another thread, for thread synchronization.

## Syntax

- `Semaphore` **CreateSemaphore**()

## Returns

Returns a new semaphore object.

## Example

```csharp
using System.Threading;
using static UltraEngine.UltraEngineAPI;

public class Program
{
    static Semaphore semaphore;

    static void EntryPoint(object extra)
    {
        // Cast to Semaphore object
        semaphore = (Semaphore)extra;

        // Wait for signaled state
        semaphore.WaitOne();
    }

    static void Main(string[] args)
    {
        // Get the displays
        var displays = GetDisplays();

        // Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

        // Create a semaphore
        semaphore = CreateSemaphore();

        // Create a thread
        var thread = CreateThread(EntryPoint, semaphore);

        while (!window.Closed() && !window.KeyDown(KEY_ESCAPE))
        {
            // Press space to signal the semaphore
            if (window.KeyHit(KEY_SPACE)) semaphore.Release();

            // Detect thread finished
            if (thread.GetState() == THREAD_FINISHED)
            {
                Notify("Thread finished!");
                return;
            }
            Sleep(1);
        }
    }
}
```