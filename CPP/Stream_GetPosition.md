# Stream::GetPosition #
This method returns the current offset in the stream for read and write operations.

## Syntax ##
uint64_t **GetPosition**()

## Returns ##
Returns the stream position in bytes.

## Example
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString path = FolderLocation(FOLDER_DOCUMENTS) + "/temp.bin";

	//Open a stream with write permissions
	auto stream = WriteFile(path);
	if (stream == NULL)
	{
		Print("Failed to write file.");
		return 0;
	}

	//Write a byte
	stream->WriteByte(1);
	Print("Position: " + String(stream->GetPosition()));
	Print("Size: " + String(stream->GetSize()));

	//Write a short
	stream->WriteShort(2);
	Print("Position: " + String(stream->GetPosition()));
	Print("Size: " + String(stream->GetSize()));

	//Write an integer
	stream->WriteInt(3);
	Print("Position: " + String(stream->GetPosition()));
	Print("Size: " + String(stream->GetSize()));

	//Write a float
	stream->WriteFloat(4);
	Print("Position: " + String(stream->GetPosition()));
	Print("Size: " + String(stream->GetSize()));

	//Write a double
	stream->WriteDouble(5);
	Print("Position: " + String(stream->GetPosition()));
	Print("Size: " + String(stream->GetSize()));

	return 0;
}
```
