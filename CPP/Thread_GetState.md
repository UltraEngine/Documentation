# Thread::GetState #
This method returns the thread's current state.

## Syntax ##
- [ThreadState](Constants.md#ThreadState) **GetState**()

## Returns ##
The returned value may be THREAD_READY, THREAD_RUNNING, or THREAD_FINISHED.

## Example ##
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

void ThreadFunc()
{
    Sleep(1000);
}

void PrintState(shared_ptr<Thread> thread)
{
    switch (thread->GetState())
    {
    case THREAD_READY:
        Print("Ready");
        break;
    case THREAD_RUNNING:
        Print("Running");
        break;
    case THREAD_FINISHED:
        Print("Finished");
        break;
    }
}

int main(int argc, const char* argv[])
{
    //Create thread
    auto thread = CreateThread(bind(ThreadFunc));
    PrintState(thread);

    //Execute thread
    thread->Resume();
    PrintState(thread);

    //Wait for thread to finish
    thread->Wait();
    PrintState(thread);

    return 0;
}
```
