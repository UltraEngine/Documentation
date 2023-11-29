```csharp
using System;
using System.Threading;

class Program
{
    static void Main(string[] args)
    {
        //Create a semaphore
        var semaphore = new Semaphore(0, 1);

        //Create a thread
        var thread = new Thread(EntryPoint);
        thread.Start(semaphore);

        while (true)
        {
            //Press space to signal the semaphore
            if (Console.KeyAvailable && Console.ReadKey(true).Key == ConsoleKey.Spacebar)
            {
                semaphore.Release();
            }

            //Detect thread finished
            if (!thread.IsAlive)
            {
                Console.WriteLine("Thread finished!");
                break;
            }

            Thread.Sleep(1);
        }
    }

    static void EntryPoint(object obj)
    {
        //Cast to Semaphore object
        var semaphore = (Semaphore)obj;

        //Wait for signaled state
        semaphore.WaitOne();
    }
}
```