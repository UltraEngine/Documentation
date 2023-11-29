# Process.Close #

This method closes a running process and returns its exit code.

## Syntax ##

- int **Close**()

## Returns

Returns the process exit code.

## Remarks ##

To avoid forcefully terminating a running process call the [Process.Wait](Process_Wait.md) method instead of this method, or wait for [Process.GetStatus](Process_GetStatus.md) to return PROCESS_FINISHED before calling this method.

## Example ##

```csharp
using System.Diagnostics;
using Ultraviolet;

public class Program
{
    public static void Main(string[] args)
    {
        string appname = "Notepad";
        string apppath = @"C:\Windows\notepad.exe";

        //Get the displays
        var displays = UltravioletContext.GetDisplays();

        //Create a window
        var window = new UltravioletWindow("Ultra Engine", 0, 0, 460, 480, displays[0]);

        //Create User Interface
        var ui = new UltravioletUI(window);

        //Create widget
        var sz = ui.Root.GetSize();
        var button = new UltravioletButton("Launch " + appname, (sz.X - 120) / 2, (sz.Y - 30) / 2, 120, 30, ui.Root);

        Process proc = null;

        while (true)
        {
            var ev = UltravioletContext.WaitForNextEvent();
            switch (ev.Type)
            {
                case UltravioletEventType.WidgetAction:
                    if (ev.Source == button)
                    {
                        if (proc != null)
                        {
                            proc.Close();
                            proc = null;
                            button.SetText("Launch " + appname);
                        }
                        else
                        {
                            button.SetText("Close " + appname);
                            proc = Process.Start(apppath);
                        }
                    }
                    break;
                case UltravioletEventType.WindowClose:
                    return;
            }
        }
    }
}
```