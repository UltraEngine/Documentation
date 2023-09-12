# Window

The Window class provides an interface for creating system application windows.

Base class: **Object**.

#### Properties

- **display**: *const shared_ptr\<Display\>&* - read-only display the window resides on.
- **position**: *const iVec2&* - read-only window position.
- **size**: *const iVec2&* - read-only window size.
- **style**: *const WindowStyles&* - read-only window style.
- **text**: *const WString&* - read-only text shown in the window titlebar.

#### Methods

- **Activate()**: activates the window.
- **ClientSize()**: returns the window dimensions.
- **Closed()**: returns true if the user has closed the window.
- **FlushKeys()**: resets the keyboard button press states.
- **FlushMouse()**: resets the mouse button press states.
- **GetHandle()**: returns the system window object.
- **GetHidden()**: gets the window visibility.
- **GetMousePosition()**: gets the current mouse position.
- **GetPosition()**: returns the window screen position.
- **GetSize()**: returns the window dimensions.
- **KeyDown()**: returns true if the key is pressed.
- **KeyHit()**: returns true if the key has been pressed since the last call.
- **MouseDown()**: returns true if the mouse button is pressed.
- **MouseHit()**: returns true if the mouse button has been pressed since the last call.
- **Maximized()**: returns true if the window is currently maximized.
- **Maximize()**: maximizes the window.
- **Minimize()**: minimizes the window.
- **Minimized()**: returns true if the window is currently minimized.
- **Restore()**: restores the window from the minimized or maximized state.
- **SetCursor()**: sets the window cursor.
- **SetHidden()**: hide and show the window.
- **SetMinSize()**: sets the minimum size the window can be resized to.
- **SetMousePosition()**: sets the mouse position.
- **SetShape()**: sets the window position and size.
- **Show()**: makes the window visible.

#### Functions

- **ActiveWindow()**: returns the focused application window.
- **CreateWindow()**: creates a new window.
- **TransformCoord()**: transforms coordinates from one window to another.