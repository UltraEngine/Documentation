# Semaphore::Wait

This method waits until the semaphore is signaled by another thread. If the semaphore has already been set to the signaled state, this method will return immediately. This method will reset the condition signaled state so it can be signaled again.

## Syntax

- void **Wait**()

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

shared_ptr<Object> EntryPoint(shared_ptr<Object> extra)
{
    //Cast to Condition object
    auto semaphore = extra->As<Semaphore>();

    //Wait for signaled state
    semaphore->Wait();

    return NULL;
}

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a condition
    auto semaphore = CreateSemaphore();

    //Create a thread
    auto thread = CreateThread(EntryPoint, cond);

    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Press space to signal the semaphore
        if (window->KeyHit(KEY_SPACE)) semaphore->Signal();

        //Detect thread finished
        if (thread->GetState() == THREAD_FINISHED)
        {
            Notify("Thread finished!");
            return 0;
        }
        Sleep(1);
    }
    return 0;
}
```
