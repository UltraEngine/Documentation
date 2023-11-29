# Widget.SetFontBold

This method sets the font weight to make text bold or normal.

## Syntax

- void **SetFontBold**(bool bold)

| Parameter | Description |
| --- | --- |
| bold | font weight |

## Example
```csharp
using System;
using UEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = UEngine.GetDisplays();

        //Create a window
        var window = UEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_CENTER);

        //Create User Interface
        var ui = UEngine.CreateInterface(window);
        var sz = ui.Root.ClientSize();

        var label = UEngine.CreateLabel("Font scale:", 10, 10, sz.X - 20, 30, ui.Root);

        var checkbox = UEngine.CreateButton("Normal", 10, 40, sz.X - 20, 30, ui.Root, ButtonFlags.BUTTON_CHECKBOX);

        var textarea = UEngine.CreateTextArea(10, 75, sz.X - 20, sz.Y - 85, ui.Root, TextAreaFlags.TEXTAREA_WORDWRAP);
        textarea.SetText("The quick brown fox jumps over the lazy dog.");

        while (true)
        {
            var ev = UEngine.WaitEvent();
            switch (ev.Id)
            {
                case EventId.EVENT_WIDGETACTION:
                    if (ev.Source == checkbox)
                    {
                        textarea.SetFontBold(ev.Data);
                        if (ev.Data)
                        {
                            checkbox.SetText("Bold");
                        }
                        else
                        {
                            checkbox.SetText("Normal");
                        }
                    }
                    break;
                case EventId.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```