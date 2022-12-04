# AllocEventId

This function allocates a unique event ID you can use for user-defined events.

## Syntax

- EventID **AllocEventId**()

## Returns

Returns a new event ID.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	const EventID EVENT_CUSTOM = AllocEventId();
	EmitEvent(EVENT_CUSTOM);
	while (PeekEvent())
	{
		auto ev = WaitEvent();
		if (ev.id == EVENT_CUSTOM) Print("Custom event received.");
	}
	return 0;
}
```
