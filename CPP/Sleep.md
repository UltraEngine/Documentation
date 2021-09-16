# Sleep

This function pauses the current thread for the specified number of milliseconds.

## Syntax

- void **Sleep**(const int time)

| Parameter | Description |
| ----- | ----- |
| time | number of milliseconds to pause |

## Remarks

This function should not be used to regulate time-sensitive processes. The accuracy of the sleep period can vary by as much as 15 milliseconds, or more. A higher resolution delay can be executed like this:

```c++
uint64_t time = 1000;
auto start = Microsecs();
while (Microsecs() - start * 1000 < tm) {}
```

The above code will provide a more precise delay, but will result in high CPU usage on the calling thread.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

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
