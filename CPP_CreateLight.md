# CreateLight #

## Syntax ##
- shared_ptr<[Light](CPP_Light.md)\> CreateLight(shared_ptr<World\> world, const LightType type)

Type may be LIGHT_POINT, LIGHT_SPOT, LIGHT_DIRECTIONAL, LIGHT_BOX, or LIGHT_STRIP.

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

	//Create material
	auto plugin = LoadPlugin("Plugins/Basis.*");
	auto mtl = CreateMaterial();
	mtl->SetTexture(LoadTexture("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Developer/default.basis"));
	box->SetMaterial(mtl);

	//Create light
  auto lighttype = LIGHT_POINT;
	auto light = CreateLight(world, lighttype);
	light->SetColor(2, 2, 2);
	light->SetRange(10);
	light->SetPosition(0, 4, 0);

	//Main loop
	while (!window->KeyHit(KEY_ESCAPE) and !window->Closed())
	{
		world->Update();
		world->Render(framebuffer);
	}
	return 0;
}
```
