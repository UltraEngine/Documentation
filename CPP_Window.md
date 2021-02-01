# Window #
The window class provides an interface for creating system application windows.

**Base class**: [Object](Object)

### Properties ###
| Name | Type | Description |
|---|---|---|
| display | const shared_ptr<[Display](Display.md)> | display the window resides on |
| text | const [WString](WString.md)& | text shown in the window titlebar |
| [Activate](Window_Activate.md) | Method | activates the window |
| [ClientSize](Window_ClientSize.md) | Method | returns the window dimensions |
| [Close](Window_Close.md) | Method | sets the closed state to true |
| [Closed](Window_Closed.md) | Method | returns true if the user has closed the window |
| [GetHandle](Window_GetHandle.md) | Method | Returns the system window object |
| [GetPosition](Window_GetPosition.md) | Method | Returns the window screen position |
| [GetSize](Window_GetSize.md) | Method | Returns the window dimensions |
| [Maximize](Window_Minimize.md) | Method | minimizes the window |
| [Minimize](Window_Maximize.md) | Method | maximizes the window |
| [Restore](Window_Minimize.md) | Method | restores the window from the minimized or maximized state |
| [Maximized](Window_Maximized.md) | Method | returns true if the window is currently maximized |
| [Minimized](Window_Minimized.md) | Method | returns true if the window is currently minimized |
| [Hide](Window_Hide.md) | Method | makes the window invisible |
| [SetShape](Window_SetShape.md) | Method | sets the window position and size |
| [Show](Window_Show.md) | Method | makes the window visible |
| [CreateWindow](CreateWindow) | Function | creates a new window |
