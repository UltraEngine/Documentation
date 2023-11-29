# Widget.GetText

This method returns the widget text.

## Syntax

- [WString](WString.md) **GetText**()

## Returns

Returns the widget text.

## Example

```csharp
using UltraEngine;
using System;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = Interface.Create(window);

        //Create widget
        var sz = ui.root.ClientSize();
        var textfield = TextField.Create(20, 20, 300, 32, ui.root);
        textfield.SetText("Here is some text!");

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case Event.EVENT_WIDGETACTION:
                    if (ev.source == textfield)
                    {
                        Print(textfield.GetText());
                    }
                    break;
                case Event.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```