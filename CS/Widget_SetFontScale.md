```csharp
using System;
using System.Collections.Generic;
using UltraEngine;

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
        var sz = ui.Root.ClientSize;

        var label = Label.Create("Font scale:", 10, 10, sz.x - 20, 30, ui.Root);

        var slider = Slider.Create(10, 40, sz.x - 20, 30, ui.Root, SliderType.Trackbar);
        slider.SetRange(1, 40);
        slider.SetValue(4);
        EventManager.EmitEvent(EventType.WidgetAction, slider, 4);

        var textarea = TextArea.Create(10, 75, sz.x - 20, sz.y - 85, ui.Root, TextAreaFlags.WordWrap);
        textarea.SetText("The quick brown fox jumps over the lazy dog.");

        while (true)
        {
            var ev = EventManager.WaitEvent();
            switch (ev.id)
            {
                case EventType.WidgetAction:
                    if (ev.source == slider)
                    {
                        textarea.SetFontScale((float)ev.data / 4.0f);
                    }
                    break;
                case EventType.WindowClose:
                    return;
            }
        }
    }
}
```