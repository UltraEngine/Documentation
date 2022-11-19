# Command

This function allows you to interact with the operating system terminal or console. This can be used to perform low-level system actions.

## Syntax

[WString](WString.md) **Command**(const [WString](WString.md)& command)

| Parameter | Description |
|---|---|
| command | command to send |

## Returns

Returns the printed output of the terminal or console.

## Remarks

On the Windows operating system the command output will be piped to a file stored in the user "ProgramData/Ultra Engine" directory. This file should be deleted if the command output contains any sensitive information.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
#ifdef _WIN32
	Print(Command("systeminfo | findstr /B /C:\"OS Name\""));
#else
	Print(Command("uname -r"));
#endif
	return 0;
}
```
