# Input #
This function waits for a line of text to be input into the program console.

## Syntax ##
- wstring **Input**()

## Returns ##
When the user enters some text and presss enter, the type string is returned.

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	Print("Enter your name:");
	wstring s = Input();
	Print(L"You entered \"" + s + L"\".");
	return 0;
}
```
