# Thread::GetResult #
This method can retrieve a return value set by a thread when it finishes execution.

## Syntax ##
- shared_ptr<[Object](Object.md)\> **GetResult**()

## Returns ##
If the thread is finished the thread result is returned, otherwise NULL is returned.

## Example ##
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

//The returned value of the thread entry point will be used as the thread result
shared_ptr<Object> MyFunc(shared_ptr<Object> o)
{
    return std::make_shared<String>("Hello!");
}

int main(int argc, const char* argv[])
{
    auto thread = CreateThread(MyFunc);
    thread->Wait();
    auto o = thread->GetResult();
    auto s = o->As<String>();
    Print(*s.get());

    return 0;
}
```
