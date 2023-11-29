# Window.GetHandle

This method returns a handle to the system window object.

## Syntax

- IntPtr **GetHandle**()
- IntPtr **GetHandle**()
- IntPtr **GetHandle**()

## Returns

Returns the system window handle. The return type depends on the platform the program is compiled for.

## Example

```csharp
using System;
using System.Runtime.InteropServices;
using UltraEngine;

class Program
{
    [DllImport("user32.dll")]
    private static extern IntPtr GetWindowLong(IntPtr hWnd, int nIndex);

    [DllImport("user32.dll")]
    private static extern IntPtr SetWindowLong(IntPtr hWnd, int nIndex, IntPtr dwNewLong);

    static void Main()
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], UltraEngine.WINDOW_TITLEBAR);

        var handle = window.GetHandle();

        #ifdef _WIN32
        //Modify the window handle with system commands
        var style = GetWindowLong(handle, GWL_EXSTYLE);
        style |= WS_EX_CONTEXTHELP;
        SetWindowLong(handle, GWL_EXSTYLE, style);
        #endif

        while (true)
        {
            var ev = UltraEngine.WaitEvent();
            switch (ev.id)
            {
                case UltraEngine.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```