# Entity::Listen

This method will cause the entity to be used for the listener's orientation for 3D sound spatialization.

## Syntax 

- void **Listen**()

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Get the displays
	auto displays = GetDisplays();

	//Create a window
	auto window = UltraEngine::CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

	//Create a world
	auto world = CreateWorld();

	//Create a framebuffer
	auto framebuffer = CreateFramebuffer(window);

	//Create a camera
	auto camera = CreateCamera(world);
	camera->SetClearColor(0.125);
	camera->SetFov(70);
	camera->SetPosition(0, 0, -3);
	camera->Listen();

	//Create a light
	auto light = CreateBoxLight(world);
	light->SetRotation(35, 45, 0);
	light->SetRange(-10, 10);

	//Create a box
	auto box = CreateBox(world);
	box->SetColor(0, 0, 1);

	//Sound
	auto sound = LoadSound("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Sound/notification.wav");
	auto speaker = CreateSpeaker(sound);
	speaker->SetLooping(true);
	speaker->SetPosition(box->GetPosition(true));
	speaker->Play();
	speaker->SetRange(10);

	//Main loop
	while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
	{
		//Move and turn with the arrow keys - best experienced with headphones
		if (window->KeyDown(KEY_UP)) camera->Move(0, 0, 0.1);
		if (window->KeyDown(KEY_DOWN)) camera->Move(0, 0, -0.1);
		if (window->KeyDown(KEY_LEFT)) camera->Turn(0, -1, 0);
		if (window->KeyDown(KEY_RIGHT)) camera->Turn(0, 1, -0);
		
		world->Update();
		world->Render(framebuffer);
	}
	return 0;
}
```
