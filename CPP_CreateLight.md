# CreateLight #

## Syntax ##
- shared_ptr<[Light](CPP_Light.md)\> CreateLight(shared_ptr<World\> world, const LightType type = LIGHT_POINT)

| Parameter | Description |
| ----- | ----- |
| world | World to create the light in. |
| type | Light type may be LIGHT_POINT, LIGHT_SPOT, LIGHT_DIRECTIONAL, LIGHT_BOX, or LIGHT_STRIP. |

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	//Create window
	auto displays = ListDisplays();
	auto window = CreateWindow(displays[0],"",0,0,1280,720);

	//Create framebuffer
	auto framebuffer = CreateFramebuffer(window);

	//Create world
	auto world = CreateWorld();

	//Create camera
	auto camera = CreateCamera(world);
	camera->SetClearColor(0.125);
	camera->Turn(35, 0, 0);
	camera->Move(0, 0, -10);

	//Create model
	auto box = CreateBox(world, 10, 1, 10);

	array<shared_ptr<Light>, 5> lights;
	int currentlight = 0;

	//Create point light
	lights[0] = CreateLight(world, LIGHT_POINT);
	lights[0]->SetColor(2, 2, 2);
	lights[0]->SetRange(10);
	lights[0]->SetPosition(0, 4, 0);

	//Create spot light
	lights[1] = CreateLight(world, LIGHT_SPOT);
	lights[1]->SetColor(2, 2, 2);
	lights[1]->SetRange(10);
	lights[1]->SetPosition(0, 4, 0);
	lights[1]->Turn(90, 0, 0);
	lights[1]->Hide();

	//Create directional light
	lights[2] = CreateLight(world, LIGHT_DIRECTIONAL);
	lights[2]->SetColor(2, 2, 2);
	lights[2]->SetRotation(80, 35, 0);
	lights[2]->Hide();

	//Create box light
	lights[3] = CreateLight(world, LIGHT_BOX);
	lights[3]->SetColor(2, 2, 2);
	lights[3]->SetRotation(90, 0, 0);
	lights[3]->SetPosition(0, 2, 0);
	lights[3]->SetScale(6);
	lights[3]->Hide();

	//Create strip light
	lights[4] = CreateLight(world, LIGHT_STRIP);
	lights[4]->SetPosition(0, 1, -5);
	lights[4]->SetColor(2, 2, 2);
	lights[4]->SetRange(5);
	lights[4]->SetScale(1, 1, 10);
	lights[4]->Hide();

	//Display text
	auto spritelayer = CreateSpriteLayer(world);
	camera->AddSpriteLayer(spritelayer);
	auto font = LoadFont("Fonts/arial.ttf");
	auto text = CreateText(spritelayer, font, "Press space to change lights.", 14.0 * displays[0]->GetScale().x);
	text->SetPosition(2, 2);

	//Main loop
	while (!window->KeyHit(KEY_ESCAPE) and !window->Closed())
	{
		if (window->KeyHit(KEY_SPACE))
		{
			lights[currentlight]->Hide();
			currentlight++;
			if (currentlight > 4) currentlight = 0;
			lights[currentlight]->Show();
		}

		world->Update();
		world->Render(framebuffer);
	}
	return 0;
}
```
