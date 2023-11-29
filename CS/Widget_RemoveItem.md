# Widget.RemoveItem

This method removes the item at the specified index.

## Syntax

```csharp
public void RemoveItem(int item)
```

| Parameter | Description |
|---|---|
| item | item index to remove, in the range from zero to the number of items minus one |

## Example

```csharp
using System;
using Ultraviolet;

class Program 
{
    static void Main(string[] args) 
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = new UserInterface(window);

        //Create widget
        var sz = ui.Root.GetSize();
        var listbox = new ListBox(20, 20, sz.X - 40, sz.Y - 40, ui.Root);

        //Add items
        for (int n = 0; n < 10; ++n)
        {
            listbox.AddItem("Item " + n.ToString(), n == 0);
        }

        //Remove an item
        listbox.RemoveItem(3);

        while (true)
        {
            var ev = UltravioletContext.RequestCurrent().GlfwWindow.WaitEvents();
            switch (ev.Type)
            {
                case UltravioletEventType.WindowClose:
                    return;
            }
        }
    }
}
```