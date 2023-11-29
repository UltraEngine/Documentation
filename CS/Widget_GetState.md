# Widget.GetState

This method retrieves the widget state.

## Syntax

- WidgetState **GetState()**

## Returns

Returns the widget state. This may be `WidgetState.Selected`, `WidgetState.Unselected`, or `WidgetState.Indeterminate`.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main()
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create a window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[0]);

        //Create User Interface
        var ui = UltraEngine.CreateInterface(window);
        var sz = ui.root.ClientSize();
        var button = UltraEngine.CreateButton("Unselected", sz.x / 2 - 40, sz.y / 2 - 15, 120, 30, ui.root, ButtonType.CheckBox);

        while (true)
        {
            Event ev = UltraEngine.WaitEvent();
            switch (ev.id)
            {
                case UltraEngine.EventID.WidgetAction:
                    if (ev.source == button)
                    {
                        if (button.GetState() == WidgetState.Selected)
                        {
                            button.SetText("Selected");
                        }
                        else
                        {
                            button.SetText("Unselected");
                        }
                    }
                    break;
                case UltraEngine.EventID.WindowClose:
                    return;
            }
        }
    }
}
```