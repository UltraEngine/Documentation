# CreateCollisionMesh #

## Syntax ##
- shared_ptr<Collision\> CreateCollisionMesh(shared_ptr<Mesh\> geometry)
- shared_ptr<Collision\> CreateCollisionMesh(shared_ptr<Model\> geometry)

## Parameters ##


## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	const bool fullscreenmode = false;

	auto displays = ListDisplays();
	Vec2 displayscale = displays[0]->GetScale();

	auto window = CreateWindow(displays[0], L"Example", 0, 0, 1280 * displayscale.x, 720 * displayscale.y);

	auto framebuffer = CreateFramebuffer(window);

	auto world = CreateWorld();

	auto camera = CreateCamera(world);
	camera->SetFOV(70);
	camera->Turn(15, 0, 0);
	camera->Move(0, 0, -12);

	auto light = CreateLight(world, LIGHT_DIRECTIONAL);
	light->SetRotation(45,35,0);

	//Load model
	auto model = LoadModel(world, "https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Models/Wooden%20Bridge/woodenbridge.gltf");
	model->SetRotation(0, 90, 0);

	//Create mesh collision
	auto collision = CreateCollisionMesh(model);
	model->SetCollision(collision);
	model->SetCollisionType(COLLISION_SCENE);

	//Add some objects to show collision
	auto box = CreateBox(world);
	box->SetPosition(0, 5, 0);
	box->SetMass(1);
	box->SetCollisionType(COLLISION_PROP);

	while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
	{
		world->Update();
		world->Render(framebuffer);
	}
	return 0;
}
```
