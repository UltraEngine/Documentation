# Window::Closed #
This method returns true if the window has been closed since the last call, or since the creation of the window.

## Syntax ##
- bool **Closed**()

## Returns ##
Returns the window closed state and resets the state to false.

## Remarks ##
This method uses a global state to detect when the window has been closed. If two different parts of your application call the method, only one will detect the close event. For finer control use the events system and listen for WINDOWCLOSE events.
