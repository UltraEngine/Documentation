# Mutex.Unlock

This method unlocks a mutex and allows other threads to execute the enclosed code.

## Syntax

```csharp
void Unlock()
```

## Remarks

Use of mutexes locks should be minimized since they can slow down multithreaded code, causing it to lose its advantages over single-threaded code.

```csharp
//-----------------------------------------------------------------------------------------------
// 
// This example demonstrates mutex locks. The mutex must be locked when the countprimenumbers 
// variable is incremented to get the correct result.
// 
//-----------------------------------------------------------------------------------------------

using System;
using System.Threading;
using System.Collections.Generic;

namespace Example
{
    class Program
    {
        static Mutex mutex = new Mutex();
        static int countprimenumbers = 0;

        static void CalcPrimeNumbers(int start, int size)
        {
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

        static void Main(string[] args)
        {
            int range = 100000;
            int threadcount = 8;
            List<Thread> threads = new List<Thread>();

            for (int n = 0; n < threadcount; ++n)
            {
                threads.Add(new Thread(() => CalcPrimeNumbers(range / threadcount * n, range / threadcount)));
                threads[n].Start();
            }

            foreach (Thread thread in threads)
            {
                thread.Join();
            }

            Console.WriteLine($"{countprimenumbers} prime numbers found.");

            Console.ReadLine();
        }
    }
}
```