# CreateMenu

This function creates a menu widget. A menu item emits a WIDGETACTION event when it is selected.

## Syntax

- Widget **CreateMenu**(string text, Widget parent);

| Parent | Description |
| --- | --- |
| text | initial widget text |
| parent | widget parent |

## Returns

Returns a new widget.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateMenu.png)

```csharp
using System;
using LeadwerksEngine.UI;

namespace MenuExample
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = GetDisplays();

            //Create a window
            var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

            //Create User Interface
            var ui = CreateInterface(window);

            //Create widget
            var sz = ui.root.ClientSize();
            var menu = CreateMenu("", ui.root);

            //Create menu items
            var menu_file = CreateMenu("File", menu);
            var menu_new = CreateMenu("New", menu_file);
            var menu_open = CreateMenu("Open", menu_file);
            var menu_save = CreateMenu("Save", menu_file);
            CreateMenu("", menu_file);
            var menu_recentfiles = CreateMenu("Recent Files", menu_file);
            var menu_recentfile1 = CreateMenu("Recent file 1", menu_recentfiles);
            var menu_recentfile2 = CreateMenu("Recent file 2", menu_recentfiles);
            var menu_recentfile3 = CreateMenu("Recent file 3", menu_recentfiles);
            CreateMenu("", menu_file);
            var menu_exit = CreateMenu("Exit", menu_file);

            var menu_tools = CreateMenu("Tools", menu);
            var menu_option = CreateMenu("Option", menu_tools);

            var menu_help = CreateMenu("Help", menu);
            var menu_helpcontents = CreateMenu("Help Contents", menu_help);

            var panel = CreatePanel(0, menu.size.y, sz.x, sz.y - menu.size.y, ui.root);
            panel.SetColor(0.15, 0.15, 0.15);

            while (true)
            {
                var ev = WaitEvent();
                switch (ev.id)
                {
                    case EventID.WidgetAction:
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
                            if (menu_option.GetState() == WidgetState.Selected)
                            {
                                menu_option.SetState(WidgetState.Unselected);
                            }
                            else
                            {
                                menu_option.SetState(WidgetState.Selected);
                            }
                        }
                        else if (ev.source == menu_save)
                        {
                            RequestFile("Save File", "", "All Files:*", 0, true);
                        }
                        else if (ev.source == menu_exit)
                        {
                            if (Confirm("Quit Program?")) return;
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
                    case EventID.WindowClose:
                        if (ev.source == window) return;
                        break;
                }
            }
        }
    }
}
```