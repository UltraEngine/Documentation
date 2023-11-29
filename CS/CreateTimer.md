# CreateTimer #
This function creates a new timer object. A timer emits a TIMERTICK event at a regular frequency. The event source will be the timer object, and the event data value will be the timer tick count.

## Syntax ##
- **Timer** **CreateTimer**(int frequency)

### Parameters ###
| Name | Description |
| --- | --- |
| frequency | timer frequency in milliseconds |

## Returns ##
Returns a new timer object.

## Example ##

```csharp
using UltraEngine;

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
        var sz = ui.root.ClientSize;

        var label = CreateLabel("", 0, 0, sz.x, sz.y, ui.root, LABEL_CENTER | LABEL_MIDDLE);
        label.FontScale = 4;

        //Create timer
        var timer = CreateTimer(1000);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_TIMERTICK:
                    label.Text = ev.data.ToString();
                    break;
                case EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```