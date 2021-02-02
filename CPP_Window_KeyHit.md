# Window::KeyHit #
Returns true if the specified key has been pressed since the last call to KeyHit, or since the creation of the window.

## Syntax ##
- bool **KeyHit**(const KeyCode key)

### Parameters ###
| Name | Description |
|---|---|
| key | code of the key to check the state of |

## Returns ##
Returns true if the specified key has been pressed, otherwise false is returned.

## Remarks ##
This method uses a global state to track whether any KEYDOWN events have occurred since the last call. If two different parts of your program both call this method, only one of them will detect that the key was pressed. The event system should be used for finer control over keyboard input.
