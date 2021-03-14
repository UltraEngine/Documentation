# Buffer::PeekString

This method returns a string value from the memory buffer.

## Syntax

- string **PeekString**(const uint64_t pos)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns

Returns a string value.

## Remarks

A runtime error will occur if the read range lies outside of the buffer extents.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	String s = "Hello, how are you today?";
	auto buffer = CreateBuffer((s.GetSize() + 1) * sizeof(s[0]));
	buffer->PokeString(0, s);
	Print(buffer->PeekString(0));

	return 0;
}
```
