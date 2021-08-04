# Sound::Play

This method plays a sound once and returns a speaker object.

## Syntax

- shared_ptr<[Speaker](Speaker.md)\> **Play**()

## Returns

Returns a new speaker object that can be used to control the sound.

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
	sound->Play();

	while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
	{
		//Play sound when space key is pressed
		if (window->KeyHit(KEY_SPACE)) sound->Play();
		Sleep(16);
	}
	return 0;
}
```
