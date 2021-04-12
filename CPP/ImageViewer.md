# Creating an Image Viewer

This page describes how to create a simple image viewing program.

## Interface Setup

Start with a new GUI project. Insert the code below into main.cpp. This will set up a basic user interface with a main panel for viewing images and a menu with a few items.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    // Get the available displays
    auto displays = GetDisplays();

    // Create a window
    auto window = CreateWindow("Image Viewer", 0, 0, 1024, 768, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE | WINDOW_CENTER);

    // Create user interface
    auto ui = CreateInterface(window);
    iVec2 sz = ui->root->ClientSize();

    // Create menu
    auto mainmenu = CreateMenu("", ui->root);
    auto menu_file = CreateMenu("File", mainmenu);
    auto menu_open = CreateMenu("Open", menu_file);
    auto menu_save = CreateMenu("Save", menu_file);
    CreateMenu("", menu_file);
    auto menu_quit = CreateMenu("Quit", menu_file);

    // Main panel
    int padding = 4;
    auto mainpanel = CreatePanel(padding,mainmenu->size.y + padding,sz.x - padding*2, sz.y - padding*2 - mainmenu->size.y, ui->root, PANEL_BORDER);
    mainpanel->SetLayout(1, 1, 1, 1);
    mainpanel->SetColor(0.1, 0.1, 0.1);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWCLOSE:
            if (ev.source == window) return 0;
            break;
        }
    }
    return 0;
}
```
