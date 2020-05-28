# LoadSound #

## Syntax ##
- shared_ptr<[Sound](API_Sound)> **LoadSound**(const string& path, const [LoadFlags](API_LoadFlags) flags = LOAD_DEFAULT)
- shared_ptr<[Sound](API_Sound)> **LoadSound**(const wstring& path, const [LoadFlags](API_LoadFlags) flags = LOAD_DEFAULT)
- shared_ptr<[Sound](API_Sound)> **LoadSound**(shared_ptr<[Stream](API_Stream)> stream, const [LoadFlags](API_LoadFlags) flags = LOAD_DEFAULT)

## Parameters ##
|Name|Description|
|-|-|
|path|file name to load|
|stream|stream to load the file from|
|flags|optional loading flags|

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	auto displays = ListDisplays();
	Vec2 displayscale = displays[0]->GetScale();
	auto window = CreateWindow(displays[0], "Example", 0, 0, 400 * displayscale.x, 300 * displayscale.y);

	//Load sound
	auto sound = LoadSound("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Sound/notification.wav");

	//Play sound
	auto speaker = CreateSpeaker();
	speaker->SetSound(sound);
	speaker->SetLoopMode(true);
	speaker->Play();

	while (window->Closed() == false)
	{
		if (window->KeyDown(KEY_ESCAPE)) break;
	}
	return 0;
}
```
