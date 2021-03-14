# Buffer::PeekDouble #
This method returns a double float value from the memory buffer.

## Syntax ##
- double **PeekDouble**(const uint64_t pos)

### Parameters ###
| Name | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns ##
Returns a double float value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents. Note that a double value is 8 bytes, twice the size of an int or float value.

## Example

#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Create a buffer
	auto buffer = CreateBuffer(20 * sizeof(double));
	
	//Poke data to the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(double); ++n)
	{
		buffer->PokeDouble(n * sizeof(double), n + 1);
	}

	//Peek and display data from the buffer
	for (int n = 0; n < buffer->GetSize() / sizeof(double); ++n)
	{
		Print(buffer->PeekDouble(n * sizeof(double)));
	}

	return 0;
}
