# CreateButton

The button widget can be used to create push buttons, checkboxes, radio buttons, and toolbar items. Buttons emit a WIDGETACTION event when pushed. Some styles use the widget state to indicate whether they are selected.

## Syntax

- `Button` **CreateButton**(string text, int x, int y, int width, int height, `Widget` parent, `ButtonStyle` style = `ButtonStyle.BUTTON_DEFAULT`)

| Parameter | Description |
| --- | --- |
| text | widget text |
| x | widget x position |
| y | widget y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | optional button style, can be any combination of `ButtonStyle.BUTTON_CANCEL`, `ButtonStyle.BUTTON_CHECKBOX`, `ButtonStyle.BUTTON_RADIO`, `ButtonStyle.BUTTON_OK`, `ButtonStyle.BUTTON_TOGGLE`, and `ButtonStyle.BUTTON_TOOLBAR`. |

## Returns

Returns a new `Button` object.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateButton.png)

```csharp
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create a window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[0], WindowStyle.WINDOW_TITLEBAR | WindowStyle.WINDOW_CENTER);

        //Create User Interface
        var ui = Engine.CreateInterface(window);

        //Create buttons
        int x = (window.ClientSize.x - 120) / 2;
        int y = 50;
        int sep = 40;

        var button = Engine.CreateButton("Button", x, y, 120, 30, ui.root);
        y += sep;

        var toggle = Engine.CreateButton("Toggle", x, y, 120, 30, ui.root, ButtonStyle.BUTTON_TOGGLE);
        y += sep;

        var toolbar = Engine.CreateButton("Toolbar", x, y, 120, 30, ui.root, ButtonStyle.BUTTON_TOOLBAR);
        y += sep;

        var checkbox = Engine.CreateButton("Checkbox", x, y, 120, 30, ui.root, ButtonStyle.BUTTON_CHECKBOX);
        y += sep;

        var radio1 = Engine.CreateButton("Option 1", x, y, 120, 30, ui.root, ButtonStyle.BUTTON_RADIO);
        radio1.SetState(WidgetState.WIDGETSTATE_SELECTED);

        y += sep;
        var radio2 = Engine.CreateButton("Option 2", x, y, 120, 30, ui.root, ButtonStyle.BUTTON_RADIO);

        while (true)
        {
            var ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case EventType.EVENT_WIDGETACTION:
                    Engine.Print(ev.source.As<Widget>().text);
                    break;
                case EventType.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```