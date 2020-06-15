# Millisecs #
This functions returns the current system time, in milliseconds.

## Syntax ##
- uint64_t Millisecs()

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	//Get the initial system time
	uint64_t starttime = Millisecs();

	//Pause for one second
	Sleep(1000);

	//Show the current time relative to the starting time
	uint64_t currenttime = Millisecs() - starttime;
	Print(currenttime);

	//Pause for one second
	Sleep(1000);

	//Show the current time relative to the starting time
	currenttime = Millisecs() - starttime;
	Print(currenttime);

	return 0;
}
```
