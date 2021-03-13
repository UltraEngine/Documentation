# CreateThread #

## Syntax ##
- shared_ptr<[Thread](Thread.md)> **CreateThread**(shared_ptr<[Object](Object.md)\> entrypoint(shared_ptr<[Object](Object.md)\> extra), shared_ptr<[Object](Object.md)\> extra = NULL, const bool start = false);
- shared_ptr<[Thread](Thread.md)> **CreateThread**(std::function<void()> entrypoint, const bool start = false);

### Parameters ###

| Name | Description |
| --- | --- |
| entrypoint | function the thread will execute when it begins |
| extra | extra value passed to the entrypoint function |
| start | if set to true the thread will begin execution immediately, otherwise it will begin in the ready state |

## Returns ##
Returns a new thread.

## Example ##
```c++
//-----------------------------------------------------------------------------------------------
// 
// This example calculates prime numbers first on a single thread, and then splits the
// task up across multiple CPU cores. THe time is measured and displayed for each run.
// 
//-----------------------------------------------------------------------------------------------

#include "UltraEngine.h"

using namespace UltraEngine;

void CalcPrimeNumbers(const int start, const int size)
{
    int i;
    for (int num = start; num <= start + size; num++) {
        int count = 0;
        for (i = 2; i <= num / 2; i++) {
            if (num % i == 0) {
                count++;
                break;
            }
        }
        if (count == 0 && num != 1)
        {
            //Print(num);
        }
    }
}

int main(int argc, const char* argv[])
{
    int range = 200000;

    Print("Single-threaded test:");
    auto starttime = Millisecs();
    CalcPrimeNumbers(1, range);
    auto elapsed = Millisecs() - starttime;
    Print(String(elapsed) + " milliseconds");

    int threadcount = MaxThreads();
    Print("Multi-threaded test (" + String(threadcount)+ " threads):");
    vector<shared_ptr<Thread> > threads(threadcount);
    starttime = Millisecs();
    for (int n = 0; n < threadcount; ++n)
    {
       threads[n] = CreateThread(bind(CalcPrimeNumbers, range / threadcount * n, range / threadcount), true);
    }
    for (int n = 0; n < threadcount; ++n)
    {
        threads[n]->Wait();
    }
    elapsed = Millisecs() - starttime;
    Print(String(elapsed) + " milliseconds");

    return 0;
}
```
