# Thread.GetState #
This method returns the thread's current state.

Syntax
```csharp
ThreadState GetState()
```

Returns
The returned value may be [ThreadState](Constants.md#ThreadState).Ready, [ThreadState](Constants.md#ThreadState).Running, or [ThreadState](Constants.md#ThreadState).Finished.

Example
```csharp
using System;
using System.Threading;

class Program
{
    static void ThreadFunc()
    {
        Thread.Sleep(1000);
    }

    static void PrintState(Thread thread)
    {
        switch (thread.GetState())
        {
            case ThreadState.Ready:
                Console.WriteLine("Ready");
                break;
            case ThreadState.Running:
                Console.WriteLine("Running");
                break;
            case ThreadState.Finished:
                Console.WriteLine("Finished");
                break;
        }
    }

    static void Main(string[] args)
    {
        //Create thread
        Thread thread = new Thread(ThreadFunc);
        PrintState(thread);

        //Execute thread
        thread.Start();
        PrintState(thread);

        //Wait for thread to finish
        thread.Join();
        PrintState(thread);
    }
}
```