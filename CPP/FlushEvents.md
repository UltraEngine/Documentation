# FlushEvents

This function clears the event queue. Any events that have not been returned in a call to [WaitEvent](WaitEvent.md) will be discarded.

## Syntax

void **FlushEvents**()

## Remarks

Your application should call this function periodically if it does not process events.
