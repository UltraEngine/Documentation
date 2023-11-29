# Window

The window class provides an interface for creating system application windows.

Base class: [Object](Object)

| Property | Type | Description |
|---|---|---|
| display | const [SharedPtr](Link)<[Display](Display.md)> | read-only display the window resides on |
| position | const [Vector2](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector2?view=netcore-3.1) | read-only window position |
| size | const [Vector2](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector2?view=netcore-3.1) | read-only window size |
| style | const [WindowStyles](Link) | read-only window style |
| text | const [string](https://docs.microsoft.com/en-us/dotnet/api/system.string?view=netcore-3.1) | read-only text shown in the window titlebar |
| [Activate](Window_Activate.md) | Method | activates the window |
| [ClientSize](Window_ClientSize.md) | Method | returns the window dimensions |
| [Closed](Window_Closed.md) | Method | returns true if the user has closed the window |
| [FlushKeys](Window_FlushKeys.md) | Method | resets the keyboard button press states |
| [FlushMouse](Window_FlushMouse.md) | Method | resets the mouse button press states |
| [GetHandle](Window_GetHandle.md) | Method | returns the system window object |
| [GetHidden](Window_GetHidden.md) | Method | gets the window visibility |
| [GetMousePosition](Window_GetMousePosition.md) | Method | gets the current mouse position |
| [GetPosition](Window_GetPosition.md) | Method | returns the window screen position |
| [GetSize](Window_GetSize.md) | Method | returns the window dimensions |
| [KeyDown](Window_KeyDown.md) | Method | returns true if the key is pressed |
| [KeyHit](Window_KeyHit.md) | Method | returns true if the key has been pressed since the last call |
| [MouseDown](Window_MouseDown.md) | Method | returns true if the mouse button is pressed |
| [MouseHit](Window_MouseHit.md) | Method | returns true if the mouse button has been pressed since the last call |
| [Maximized](Window_Maximized.md) | Method | returns true if the window is currently maximized |
| [Maximize](Window_Maximize.md) | Method | maximizes the window |
| [Minimize](Window_Minimize.md) | Method | minimizes the window |
| [Minimized](Window_Minimized.md) | Method | returns true if the window is currently minimized |
| [Restore](Window_Restore.md) | Method | restores the window from the minimized or maximized state |
| [SetCursor](Window_SetCursor.md) | Method | sets the window cursor |
| [SetHidden](Window_SetHidden.md) | Method | hide and show the window |
| [SetMinSize](Window_SetMinSize.md) | Method | sets the minimum size the window can be resized to |
| [SetMousePosition](Window_SetMousePosition.md) | Method | sets the mouse position |
| [SetShape](Window_SetShape.md) | Method | sets the window position and size |
| [Show](Window_Show.md) | Method | makes the window visible |
| [ActiveWindow](ActiveWindow.md) | Function | returns the focused application window |
| [CreateWindow](CreateWindow.md) | Function | creates a new window |
| [TransformCoord](TransformCoord.md) | Function | transforms coordinates from one window to another |

```csharp
// Example:
using System;

class Program
{
    static void Main(string[] args)
    {
        // Create a window
        Window window = CreateWindow("MyWindow", 800, 600);

        // Show the window
        window.Show();

        // Main loop
        while (!window.Closed())
        {
            // Process events

            // Handle keyboard input
            if (window.KeyHit(Keys.Space))
            {
                // Space key pressed
            }

            // Handle mouse input
            if (window.MouseHit(0))
            {
                // Left mouse button clicked
            }
        }
    }
}
```