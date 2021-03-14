# Buffer::PeekWString
This method returns a wide string value from the memory buffer.

## Syntax
- string **PeekWString**(const uint64_t pos)

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns

Returns a wide string value.

## Remarks

A runtime error will occur if the read range lies outside of the buffer extents.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString s = "Hello, how are you today?";
	auto buffer = CreateBuffer((s.GetSize() + 1) * sizeof(s[0]));
	buffer->PokeWString(0, s);
	Print(buffer->PeekWString(0));

	return 0;
}
```
