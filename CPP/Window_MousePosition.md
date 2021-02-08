# Window::MousePosition #
This method returns the mouse position relative to the window, in integer screen coordinates.

## Syntax ##
- iVec3 **MousePosition**()

## Returns ##
Returns the mouse screen position in the x and y components of the vector, and the mouse wheel position in the z component.

## Remarks ##
This method uses integer coordinates. For higher-precision mouse input use the [MouseMovement](Window_MouseMovement.md) method.
