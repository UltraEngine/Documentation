# CreateMutex

This function creates a new Mutex object.

## Syntax

- `Mutex` **CreateMutex**()

## Returns

Returns a new Mutex object.

```csharp
//-----------------------------------------------------------------------------------------------
// 
// This example demonstrates mutex locks. The mutex must be locked when the countprimenumbers 
// variable is incremented, to get the correct result.
// 
//-----------------------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Threading;

namespace UltraEngine
{
    public class Program
    {
        static Mutex mutex = CreateMutex();
        static int countprimenumbers = 0;

        static void CalcPrimeNumbers(object data)
        {
            int start = (int)data;
            int size = start + range / threadcount;
            int i;
            for (int num = start; num <= size; num++)
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
               Thread thread = new Thread(new ParameterizedThreadStart(CalcPrimeNumbers));
               thread.Start(range / threadcount * n);
               threads.Add(thread);
            }
            for (int n = 0; n < threadcount; ++n)
            {
                threads[n].Join();
            }

            Console.WriteLine(countprimenumbers + " prime numbers found.");
        }
    }
}
```