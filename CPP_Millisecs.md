# Millisecs #
This function returns the current system time, in milliseconds.

## Syntax ##
- uint64_t **Millisecs**()

## Returns ##
Returns the current system time, in milliseconds.

## Example ##
```c+
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	//Get the initial system time
	auto starttime = Millisecs();

	//Pause for one second
	Sleep(1000);

	//Show the current time relative to the starting time
	auto currenttime = Millisecs() - starttime;
	Print(currenttime);

	//Pause for one second
	Sleep(1000);

	//Show the current time relative to the starting time
	currenttime = Millisecs() - starttime;
	Print(currenttime);

	return 0;
}
```
