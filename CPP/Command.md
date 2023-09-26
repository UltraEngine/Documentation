# Command

This function allows you to interact with the operating system terminal or console. This can be used to perform low-level system actions.

## Syntax

- int **Command**(const [WString](WString.md)& command, shared_ptr<[Stream](Stream.md)\> stream = NULL)

| Parameter | Description |
|---|---|
| command | command to send |
| stream | stream to capture any printed output |

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
	shared_ptr<Stream> stream = CreateBufferStream();
#ifdef _WIN32
	Command("systeminfo | findstr /B /C:\"OS Name\"", stream);
#else
	Command("uname -r", stream);
#endif
	while (not stream->Eof())
	{
		Print(stream->ReadLine());
	}
	return 0;
}
```
