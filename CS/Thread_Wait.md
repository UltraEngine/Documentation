# Thread.Wait #
This method pauses the calling thread until the specified thread is finished running.

## Syntax ##
- void **Wait**()

## Example ##

```csharp
//-----------------------------------------------------------------------------------------------
// 
// This example calculates prime numbers first on a single thread, and then splits the
// task up across multiple CPU cores. THe time is measured and displayed for each run.
// 
//-----------------------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Threading;

class Program
{
    static void CalcPrimeNumbers(int start, int size)
    {
        int i;
        for (int num = start; num <= start + size; num++)
        {
            int count = 0;
            for (i = 2; i <= num / 2; i++)
            {
                if (num % i == 0)
                {
                    count++;
                    break;
                }
            }
            if (count == 0 && num != 1)
            {
                //Console.WriteLine(num);
            }
        }
    }

    static void Main(string[] args)
    {
        int range = 200000;

        Console.WriteLine("Single-threaded test:");
        var starttime = Environment.TickCount;
        CalcPrimeNumbers(1, range);
        var elapsed = Environment.TickCount - starttime;
        Console.WriteLine(elapsed + " milliseconds");

        int threadcount = Environment.ProcessorCount;
        Console.WriteLine("Multi-threaded test (" + threadcount + " threads):");
        List<Thread> threads = new List<Thread>(threadcount);
        starttime = Environment.TickCount;
        for (int n = 0; n < threadcount; ++n)
        {
            int start = range / threadcount * n;
            int threadSize = range / threadcount;
            threads.Add(new Thread(() => CalcPrimeNumbers(start, threadSize)));
            threads[n].Start();
        }
        foreach (Thread thread in threads)
        {
            thread.Join();
        }
        elapsed = Environment.TickCount - starttime;
        Console.WriteLine(elapsed + " milliseconds");
    }
}
```