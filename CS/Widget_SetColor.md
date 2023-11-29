# Widget.SetColor

This method sets a widget's color value.

## Syntax

- void **SetColor**(float r, float g, float b, float a = 1.0f, WidgetColor index = WIDGETCOLOR_BACKGROUND)
- void **SetColor**(Vec4 color, WidgetColor index = WIDGETCOLOR_BACKGROUND)

| Parameter | Description |
| --- | --- |
| r | red component of the color to set |
| g | green component of the color to set |
| b | blue component of the color to set |
| a | alpha component of the color to set |
| color | color to set |
| index | color index |

## Remarks

 The color index can be any of the following values:

- WIDGETCOLOR_BACKGROUND
- WIDGETCOLOR_SUNKEN
- WIDGETCOLOR_RAISED
- WIDGETCOLOR_BORDER
- WIDGETCOLOR_FOREGROUND
- WIDGETCOLOR_SELECTION
- WIDGETCOLOR_HIGHLIGHT
- WIDGETCOLOR_SELECTEDTEXT
- WIDGETCOLOR_SLIDERARROW
- WIDGETCOLOR_SLIDERTRACK
- WIDGETCOLOR_SLIDERTRACKHOVERED
- WIDGETCOLOR_MENUBORDER
- WIDGETCOLOR_POPUP

## Example

```csharp
using System.Threading;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        // Get the displays
        var displays = GetDisplays();

        // Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        // Create User Interface
        var ui = CreateInterface(window);
        var sz = ui.root.ClientSize;

        // Create widget
        var panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.root);
        
        // Fade to black over ten seconds
        panel.SetColor(new Vec4(0, 0, 0, 1), WIDGETCOLOR_BACKGROUND, 10000);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```