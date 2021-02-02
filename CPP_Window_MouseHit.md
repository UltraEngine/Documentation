# Window::MouseHit #
Returns true if the specified mouse button has been pressed since the last call to the method, or since the creation of the window.

## Syntax ##
- bool **MouseHit**(const MouseButton button)

### Parameters ###
| Name | Description |
|---|---|
| button | mouse button to check the state of |

## Returns ##
Returns true if the specified mouse button has been pressed, otherwise false is returned.

## Remarks ##
This method uses a global state to track whether any MOUSEDOWN events have occurred since the last call. If two different parts of your program both call this method, only one of them will detect that the button was pressed. The event system should be used for finer control over mouse input.
