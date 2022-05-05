# CreateSemaphore

This function creates a condition object which can be signaled by one thread and waited on by another thread, for thread synchronization.

## Syntax

- shared_ptr<[Condition](Condition.md)\> **CreateCondition**()

## Returns

Returns a new condition object.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

shared_ptr<Object> EntryPoint(shared_ptr<Object> extra)
{
    //Cast to Condition object
    auto cond = extra->As<Condition>();

    //Wait for signaled state
    cond->Wait();

    return NULL;
}

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a condition
    auto cond = CreateCondition();

    //Create a thread
    auto thread = CreateThread(EntryPoint, cond);

    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Press space to signal the condition
        if (window->KeyHit(KEY_SPACE)) cond->Signal();

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
