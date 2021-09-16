# Microsecs

This function uses a high-resolution timer to return the current system time, in microseconds.

## Syntax

- uint64_t **Microsecs**()

## Returns

Returns the current system time, in microseconds.

## Example

```c+
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Get the initial system time
	auto starttime = Microsecs();

	//Pause for one second
	Sleep(1000);

	//Show the current time relative to the starting time
	auto currenttime = Microsecs() - starttime;
	Print(currenttime);

	//Pause for one second
	Sleep(1000);

	//Show the current time relative to the starting time
	currenttime = Microsecs() - starttime;
	Print(currenttime);

	return 0;
}
```
