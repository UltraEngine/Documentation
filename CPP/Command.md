# Command

This function allows you to interact with the operating system terminal or console. This can be used to perform low-level system actions.

## Syntax

- int **Command**(const [WString](WString.md)& command, shared_ptr<[Stream](Stream.md)\> stream = NULL)

| Parameter | Description |
|---|---|
| command | command to send |

## Returns

Returns the command result.

## Remarks

On the Windows operating system the command output will be piped to a file stored in the system "ProgramData/Ultra Engine" directory. This file should be deleted if the command output contains any sensitive information.

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
