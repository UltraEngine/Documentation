# CreateMeshCollider #

## Syntax ##
- shared_ptr<[Collider](Collision.md)\> **CreateMeshCollider**(shared_ptr<[Mesh](Mesh.md)\> geometry)
- shared_ptr<[Collider](Collision.md)\> **CreateMeshCollider**(shared_ptr<[Model](Model.md)\> geometry)

## Parameters ##
|Name|Description|
|-|-|
|**geometry**|mesh or model to build the collision from|

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	auto displays = ListDisplays();
	Vec2 displayscale = displays[0]->GetScale();

	auto window = CreateWindow(displays[0], L"Example", 0, 0, 1280 * displayscale.x, 720 * displayscale.y);

	auto framebuffer = CreateFramebuffer(window);

	auto world = CreateWorld();

	auto camera = CreateCamera(world);
	camera->SetFOV(70);
	camera->Turn(15, 0, 0);
	camera->Move(0, 0, -12);
	camera->SetClearColor(0.125);

	auto light = CreateLight(world, LIGHT_DIRECTIONAL);
	light->SetRotation(45,35,0);

	//Load model
	auto model = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Structures/wooden%20bridge.glb");
	model->SetRotation(0, 90, 0);
	
	//Create collision
	auto collision = CreateMeshCollider(model);
	model->SetCollider(collision);
	model->SetCollisionType(COLLISION_SCENE);

	//Add some objects to show collision
	vector<shared_ptr<Entity> > boxes;
	for (int n = 0; n < 5; ++n)
	{
		auto box = CreateBox(world);
		box->SetScale(2);
		box->SetPosition(Random(-2,2), 8 + 3 * n, Random(-2, 2));
		box->SetColor(0, Random(), Random());
		box->SetMass(1);
		boxes.push_back(box);
	}
	
	while (window->Closed() == false and window->KeyHit(KEY_ESCAPE) == false)
	{
		world->Update();
		world->Render(framebuffer);
	}
	return 0;
}
```