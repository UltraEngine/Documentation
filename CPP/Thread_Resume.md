# Thread::Resume #
This method resumes execution of a thread.

## Syntax ##
- void **Resume**()

## Example ##
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

auto mutex = make_shared<Mutex>();
bool quitthread = false;

void ThreadFunc(shared_ptr<Widget> widget)
{
    while (true)
    {
        mutex->Lock();
        widget->SetColor(Random(0, 1), Random(0, 1), Random(0, 1), 1);
        if (quitthread) return;
        mutex->Unlock();
        Sleep(500);
    }
}

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create buttons
    int x = (window->ClientSize().x - 120) / 2;
    int y = 50;
    int sep = 40;

    auto button = CreateButton("Pause", x, y, 120, 30, ui->root, BUTTON_TOGGLE);
    
    auto thread = CreateThread(bind(ThreadFunc, ui->root), true);

    while (true)
    {
        mutex->Lock();
        while (PeekEvent())
        {
            const Event ev = WaitEvent();
            switch (ev.id)
            {
            case EVENT_WIDGETACTION:
                if (ev.source == button)
                {
                    if (button->GetState())
                    {
                        button->SetText("Resume");
                        thread->Pause();
                    }
                    else
                    {
                        button->SetText("Pause");
                        thread->Resume();
                    }
                }
                break;
            case EVENT_WINDOWCLOSE:
                quitthread = true;
                mutex->Unlock();
                thread->Resume();
                thread->Wait();
                return 0;
                break;
            }
        }
        mutex->Unlock();
        Sleep(1);
    }
    return 0;
}
```
