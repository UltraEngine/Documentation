# Input #
This function waits for a line of text to be input into the program console.

## Syntax ##
- string **Input**(const wstring& message)
- wstring **Input**(const wstring& message)

| Parameter | Description |
| ----- | ----- |
| message | Message to print before the input is received. |

## Returns ##
When the user enters some text and presses enter, the typed input is returned.

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	string s = Input("Enter your name:");
	Print("You entered \"" + s + "\".");
	return 0;
}
```
