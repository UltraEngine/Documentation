# Buffer::Clear #
When a buffer is first created its contents are random. This method sets each byte in the allocated memory block to zero.

## Syntax ##
- void **Clear**()

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	auto buffer = CreateBuffer(4);
	Print("Initial contents:" + String(buffer->PeekInt(0)));
	buffer->Clear();
	Print(buffer->PeekInt(0));
	return 0;
}
```
