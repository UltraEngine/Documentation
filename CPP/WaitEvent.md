# WaitEvent #
This function waits until an event is available in the event queue and returns the oldest event.

## Syntax ##
[Event](Event.md) **WaitEvent**()

## Returns ##
Returns the oldest event in the queue.

## Remarks ##
Use [PeekEvent](PeekEvent.md) to check if any events are available before calling this function, if you don't want the application to pause.