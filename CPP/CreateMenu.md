# CreateMenu

This function creates a menu widget. A menu item emits a WIDGETACTION event when it is selected.

Note that menu widgets are only compatible with an interface created directly on a window.

## Syntax

- shared_ptr<[Widget](Widget.md)> **CreateMenu**(const [WString](WString.md)& text, shared_ptr<[Widget](Widget.md)> parent);

| Parent | Description |
| --- | --- |
| text | initial widget text |
| parent | widget parent |

## Returns

Returns a new widget, or NULL if the interface was not created on a window.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateMenu.png)

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto sz = ui->root->ClientSize();
    auto menu = CreateMenu("", ui->root);

    //Create menu items
    auto menu_file = CreateMenu("File", menu);
    const auto menu_new = CreateMenu("New", menu_file);
    auto menu_open = CreateMenu("Open", menu_file);
    auto menu_save = CreateMenu("Save", menu_file);
    CreateMenu("", menu_file);
    auto menu_recentfiles = CreateMenu("Recent Files", menu_file);
    auto menu_recentfile1 = CreateMenu("Recent file 1", menu_recentfiles);
    auto menu_recentfile2 = CreateMenu("Recent file 2", menu_recentfiles);
    auto menu_recentfile3 = CreateMenu("Recent file 3", menu_recentfiles);
    CreateMenu("", menu_file);
    auto menu_exit = CreateMenu("Exit", menu_file);
    
    auto menu_tools = CreateMenu("Tools", menu);
    const auto menu_option = CreateMenu("Option", menu_tools);

    auto menu_help = CreateMenu("Help", menu);
    const auto menu_helpcontents = CreateMenu("Help Contents", menu_help);

    auto panel = CreatePanel(0, menu->size.y, sz.x, sz.y - menu->size.y, ui->root);
    panel->SetColor(0.15, 0.15, 0.15);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            if (ev.source == menu_new)
            {
                Confirm("Create New?");
            }
            else if (ev.source == menu_open)
            {
                RequestFile();
            }
            else if (ev.source == menu_option)
            {
                if (menu_option->GetState() == WIDGETSTATE_SELECTED)
                {
                    menu_option->SetState(WIDGETSTATE_UNSELECTED);
                }
                else
                {
                    menu_option->SetState(WIDGETSTATE_SELECTED);
                }
            }
            else if (ev.source == menu_save)
            {
                RequestFile("Save File", "", "All Files:*", 0, true);
            }
            else if (ev.source == menu_exit)
            {
                if (Confirm("Quit Program?")) return 0;
            }
            else if (ev.source == menu_recentfile1)
            {
                Notify("Recent file 1");
            }
            else if (ev.source == menu_recentfile2)
            {
                Notify("Recent file 2");
            }
            else if (ev.source == menu_recentfile3)
            {
                Notify("Recent file 3");
            }
            else if (ev.source == menu_helpcontents)
            {
                RunFile("https://www.ultraengine.com/learn");
            }
            break;
        case EVENT_WINDOWCLOSE:
            if (ev.source == window) return 0;
            break;
        }
    }
    return 0;
}
```
