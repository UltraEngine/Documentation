# Mutex.Lock()

This method locks a mutex. When a mutex is locked, other threads that lock the mutex will pause until the locking thread calls [Mutex.Unlock()](Mutex_Unlock.md).

## Syntax

- void **Lock**()

## Remarks

Use of mutexes locks should be minimized, as they can slow down multithreaded code so that it loses its advantages over single-threaded code.

```csharp
//-----------------------------------------------------------------------------------------------
// 
// This example demonstrates mutex locks. The mutex must be locked when the countprimenumbers 
// variable is incremented, to get the correct result.
// 
//-----------------------------------------------------------------------------------------------

using System;
using System.Threading;
using System.Collections.Generic;

public class Program
{
    private static Mutex mutex = new Mutex();
    private static int countprimenumbers = 0;

    public static void CalcPrimeNumbers(object args)
    {
        int start = (int)((object[])args)[0];
        int size = (int)((object[])args)[1];

        for (int num = start; num <= start + size; num++)
        {
            int count = 0;
            for (int i = 2; i <= num / 2; i++)
            {
                if (num % i == 0)
                {
                    count++;
                    break;
                }
            }
            if (count == 0 && num != 1)
            {
                mutex.WaitOne();
                countprimenumbers++;
                mutex.ReleaseMutex();
            }
        }
    }

    public static void Main(string[] args)
    {
        int range = 100000;
        int threadcount = 8;
        List<Thread> threads = new List<Thread>();

        for (int n = 0; n < threadcount; ++n)
        {
            threads.Add(new Thread(new ParameterizedThreadStart(CalcPrimeNumbers)));
            threads[n].Start(new object[] { range / threadcount * n, range / threadcount });
        }
        for (int n = 0; n < threadcount; ++n)
        {
            threads[n].Join();
        }

        Console.WriteLine(countprimenumbers + " prime numbers found.");
    }
}
```