# Mutex::Unlock #
This method unlocks a mutex and allows other threads to execute the enclosed code.

## Syntax ##
- void **Unlock**()

```c++
//-----------------------------------------------------------------------------------------------
// 
// This example demonstrates mutex locks. The mutex must be locked when the countprimenumbers 
// variable is incremented, to get the correct result.
// 
//-----------------------------------------------------------------------------------------------

#include "UltraEngine.h"

using namespace UltraEngine;

shared_ptr<Mutex> mutex = CreateMutex();
int countprimenumbers = 0;

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
            mutex->Lock();
            countprimenumbers++;
            mutex->Unlock();
        }
    }
}

int main(int argc, const char* argv[])
{
    int range = 100000;
    int threadcount = 8;
    vector<shared_ptr<Thread> > threads(threadcount);

    for (int n = 0; n < threadcount; ++n)
    {
       threads[n] = CreateThread(bind(CalcPrimeNumbers, range / threadcount * n, range / threadcount), true);
    }
    for (int n = 0; n < threadcount; ++n)
    {
        threads[n]->Wait();
    }

    Print(String(countprimenumbers) + " prime numbers found.");

    return 0;
}
```
