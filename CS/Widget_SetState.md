# Widget.SetState

This method sets the widget state. The widget state may be WIDGETSTATE_SELECTED, WIDGETSTATE_UNSELECTED, or WIDGETSTATE_INDETERMINATE.

## Syntax

- void **SetState**(WidgetState state)
- void **SetState**(bool selected)

| Parameter | Description |
|---|---|
| state | widget state to set, either WIDGETSTATE_SELECTED, WIDGETSTATE_UNSELECTED, or WIDGETSTATE_INDETERMINATE |
| selected | if true the state will be WIDGETSTATE_SELECTED, otherwise it will be WIDGETSTATE_UNSELECTED |

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = new Window("Ultra Engine", 0, 0, 640, 480, displays[0]);

        //Create User Interface
        var ui = new Interface(window);
        var sz = ui.root.ClientSize();
        var button = new Button("Checkbox", sz.x / 2 - 40, sz.y / 2 - 15, 80, 30, ui.root, Button.Type.CHECKBOX);

        //Set the widget state
        button.SetState(WidgetState.INDETERMINATE);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case Event.ID.WINDOWCLOSE:
                    return;
            }
        }
    }
}
```

Note: The above code assumes that the necessary namespaces and classes are imported/defined.