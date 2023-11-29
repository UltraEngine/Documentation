## CreateThread

This function creates a new Thread object.

### Syntax

- `Thread` **CreateThread**(Action entrypoint, object extra = null, bool start = true);
- `Thread` **CreateThread**(Action entrypoint, bool start = true);

| Parameter | Description |
| --- | --- |
| entrypoint | function the thread will execute when it begins |
| extra | extra value passed to the entrypoint function |
| start | if set to true the thread will begin execution immediately, otherwise it will begin in the ready state |

### Returns

Returns a new thread object.

### Example

```csharp
//-----------------------------------------------------------------------------------------------
// 
// This example calculates prime numbers first on a single thread, and then splits the
// task up across multiple CPU cores. THe time is measured and displayed for each run.
// 
//-----------------------------------------------------------------------------------------------

using System;
using System.Threading;

public class Program
{
    public static void CalcPrimeNumbers(object obj)
    {
        Tuple<int, int> tuple = (Tuple<int, int>)obj;
        int start = tuple.Item1;
        int size = tuple.Item2;

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
                //Console.WriteLine(num);
            }
        }
    }

    public static void Main(string[] args)
    {
        int range = 200000;

        Console.WriteLine("Single-threaded test:");
        var starttime = DateTime.Now;
        CalcPrimeNumbers(new Tuple<int, int>(1, range));
        var elapsed = DateTime.Now - starttime;
        Console.WriteLine(elapsed.TotalMilliseconds + " milliseconds");

        int threadcount = 4;
        Console.WriteLine("Multi-threaded test (" + threadcount + " threads):");
        Thread[] threads = new Thread[threadcount];
        starttime = DateTime.Now;
        for (int n = 0; n < threadcount; ++n)
        {
            threads[n] = new Thread(() => CalcPrimeNumbers(new Tuple<int, int>(range / threadcount * n, range / threadcount)));
            threads[n].Start();
        }
        for (int n = 0; n < threadcount; ++n)
        {
            threads[n].Join();
        }
        elapsed = DateTime.Now - starttime;
        Console.WriteLine(elapsed.TotalMilliseconds + " milliseconds");
    }
}
````