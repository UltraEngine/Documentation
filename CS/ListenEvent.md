# ListenEvent

This function sets a callback function that will be executed when an event occurs.

## Syntax

- void **ListenEvent**(EventId id, Widget source, Func<Event, Object, bool> callback, Object extra = null)

| Parameter | Description |
|---|---|
| id | event ID to listen for, or EVENT_NONE to listen for all events |
| source | event source to listen for, or null for events emitted from any source |
| callback | function to call when event is triggered |
| extra | extra object to pass to the callback function |

## Remarks

Internally, this function will store a weak reference to the event source and a shared reference to the extra field.

If the callback function returns false, no more callbacks will be executed and no event will be added to the event queue.

## Example

The first example shows another way to quit the program when the window is closed:

```csharp
using System;
using UltraEngine;

class Program
{
    static bool EventCallback(Event ev, Object extra)
    {
        Environment.Exit(0);
        return true;
    }

    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = Interface.Create(window);

        ListenEvent(EventId.EVENT_WINDOWCLOSE, window, EventCallback);

        while (true)
        {
            WaitEvent();
        }
    }
}
```

The example below demonstrates how an event listener can be used for custom resizing behavior:

```csharp
using System;
using UltraEngine;

class Program
{
    static bool EventCallback(Event ev, Object extra)
    {
        var panel = (Widget)extra;
        var sz = panel.GetParent().ClientSize();
        panel.SetShape(50, 50, sz.X - 100, sz.Y - 100);
        panel.SetText(sz.X + " x " + sz.Y);
        return true;
    }

    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_RESIZABLE);

        //Create user interface
        var ui = Interface.Create(window);
        var sz = ui.Root.ClientSize();
        var panel = Panel.Create(50, 50, sz.X - 100, sz.Y - 100, ui.Root);
        panel.SetColor(0, 0, 0);

        //Comment this line out to see why it is needed. ;)
        ListenEvent(EventId.EVENT_WINDOWSIZE, window, EventCallback, panel);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.Id)
            {
                case EventId.EVENT_WINDOWCLOSE:
                    if (ev.Source == window) return;
                    break;
                case EventId.EVENT_WINDOWSIZE:
                    sz = panel.GetParent().ClientSize();
                    panel.SetShape(50, 50, sz.X - 100, sz.Y - 100);
                    panel.SetText(sz.X + " x " + sz.Y);
                    break;
            }
        }
    }
}
```