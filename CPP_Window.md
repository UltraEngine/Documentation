# Window #
The window class provides an interface for creating system application windows.

**Base class**: [Object](Object)

### Properties ###
| Name | Type | Description |
|---|---|---|
| display | const shared_ptr<[Display](Display.md)\>& | display the window resides on |
| text | const [WString](WString.md)& | text shown in the window titlebar |
| [Activate](Window_Activate.md) | Method | activates the window |
| [ClientSize](Window_ClientSize.md) | Method | returns the window dimensions |
| [Close](Window_Close.md) | Method | sets the closed state to true |
| [Closed](Window_Closed.md) | Method | returns true if the user has closed the window |
| [GetHandle](Window_GetHandle.md) | Method | returns the system window object |
| [GetPosition](Window_GetPosition.md) | Method | returns the window screen position |
| [GetSize](Window_GetSize.md) | Method | returns the window dimensions |
| [KeyDown](Window_KeyDown.md) | Method | returns true if the key is pressed |
| [KeyHit](Window_KeyHit.md) | Method | returns true if the key has been pressed since the last call |
| [MouseDown](Window_KeyDown.md) | Method | returns true if the mouse button is pressed |
| [MouseHit](Window_KeyHit.md) | Method | returns true if the mouse button has been pressed since the last call |
| [FlushMouse](Window_FlushMouse.md) | Method | resets the mouse button press states |
| [FlushKeys](Window_FlushKeys.md) | Method | resets the keyboard button press states |
| [ShowMouse](Window_ShowMouse.md) | Method | shows the mouse pointer |
| [HideMouse](Window_HideMouse.md) | Method | hides the mouse pointer |
| [MoveMouse](Window_MoveMouse.md) | Method | moves the mouse to the specified position |
| [MousePosition](Window_MousePosition.md) | Method | gets the current mouse position |
| [MouseMovement](Window_MouseMovement.md) | Method | gets the mouse movement speed in high-precision coordinates |
| [Maximize](Window_Minimize.md) | Method | minimizes the window |
| [Minimize](Window_Maximize.md) | Method | maximizes the window |
| [Restore](Window_Minimize.md) | Method | restores the window from the minimized or maximized state |
| [Maximized](Window_Maximized.md) | Method | returns true if the window is currently maximized |
| [Minimized](Window_Minimized.md) | Method | returns true if the window is currently minimized |
| [Hide](Window_Hide.md) | Method | makes the window invisible |
| [SetMinSize](Window_SetMinSize.md) | Method | sets the minimum size the window can be resized to |
| [SetShape](Window_SetShape.md) | Method | sets the window position and size |
| [Show](Window_Show.md) | Method | makes the window visible |
| [CreateWindow](CreateWindow.md) | Function | creates a new window |
| [TransformCoord](TransformCoord.md) | Function | transforms coordinates from one window to another |
