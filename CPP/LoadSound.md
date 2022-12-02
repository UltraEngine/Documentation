# LoadSound

## Syntax
- shared_ptr<[Sound](Sound)> **LoadSound**(const [WString](WString.md)& path, const [LoadFlags](Constants.md#LoadFlags) flags = LOAD_DEFAULT)
- shared_ptr<[Sound](Sound)> **LoadSound**(shared_ptr<[Stream](Stream.md)> stream, const [LoadFlags](Constants.md#LoadFlags) flags = LOAD_DEFAULT)

|Parameter|Description|
|-|-|
|path|file name to load|
|stream|stream to load the file from|
|flags|optional loading flags, can be LOAD_DEFAULT or any combination of LOAD_UNMANAGED and LOAD_QUIET |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Get the displays
	auto displays = GetDisplays();

	//Create window
	auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

	//Load sound
	auto sound = LoadSound("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Sound/notification.wav");

	//Play sound
	auto speaker = CreateSpeaker();
	speaker->SetSound(sound);
	speaker->SetLooping(true);
	speaker->Play();

	while (window->Closed() == false)
	{
		if (window->KeyDown(KEY_ESCAPE)) break;
	}
	return 0;
}
```
