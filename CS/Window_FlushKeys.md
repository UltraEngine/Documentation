# Window.FlushKeys()

This method resets the key button states.

## Syntax

- void **FlushKeys**()

## Example

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UltraEngine;

namespace Game
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = Engine.GetDisplays();

            //Create window
            var window = Engine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

            //Create user interface
            var ui = Engine.CreateInterface(window);
            var sz = ui.root.ClientSize();
            var label = Engine.CreateLabel("Press space key", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.root);

            while (true)
            {
                var ev = Engine.WaitEvent();
                switch (ev.id)
                {
                    case EventID.EVENT_KEYDOWN:
                        if (ev.source == window && ev.data == KeyCode.KEY_SPACE)
                        {
                            //This call to FlushKeys() resets the key hit state so it will not be detected:
                            window.FlushKeys();

                            Engine.Notify("KeyHit: " + window.KeyHit(KeyCode.KEY_SPACE).ToString());
                        }
                        break;

                    case EventID.EVENT_WINDOWCLOSE:
                        return;
                }
            }
        }
    }
}
```