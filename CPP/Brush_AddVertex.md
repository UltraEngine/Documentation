# Brush::AddVertex

This method adds a new vertex to a brush.

## Syntax

- int **AddVertex**(const float x, const float y, const float z)
- int **AddVertex**(const [Vec3](Vec3)& position)

## Returns

Returns the new vertex index.

## Example

This example creates a box brush from scratch.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Get the displays
	auto displays = GetDisplays();

	//Create a window
	auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

	//Create a framebuffer
	auto framebuffer = CreateFramebuffer(window);

	//Create a world
	auto world = CreateWorld();

	//Create a camera    
	auto camera = CreateCamera(world);
	camera->SetClearColor(0.125);
	camera->Turn(35, 0, 0);
	camera->Move(0, 0, -4);

	//Create light
	auto light = CreateBoxLight(world);
	light->SetRange(-20, 20);
	light->SetArea(20, 20);
	light->SetRotation(35, 35, 0);

	//Create brush
	auto brush = CreateBrush(world);
	brush->SetColor(0, 0, 1);

	//Add brush vertices
	float w = 1; float h = 1; float d = 1;
	brush->AddVertex(w * 0.5, h * 0.5, d * 0.5);
	brush->AddVertex(-w * 0.5, h * 0.5, d * 0.5);
	brush->AddVertex(-w * 0.5, h * 0.5, -d * 0.5);
	brush->AddVertex(w * 0.5, h * 0.5, -d * 0.5);
	brush->AddVertex(w * 0.5, -h * 0.5, d * 0.5);
	brush->AddVertex(-w * 0.5, -h * 0.5, d * 0.5);
	brush->AddVertex(-w * 0.5, -h * 0.5, -d * 0.5);
	brush->AddVertex(w * 0.5, -h * 0.5, -d * 0.5);

	//Add faces
	auto face = brush->AddFace();
	face->AddIndice(0);
	face->AddIndice(1);
	face->AddIndice(2);
	face->AddIndice(3);

	face = brush->AddFace();
	face->AddIndice(4);
	face->AddIndice(5);
	face->AddIndice(6);
	face->AddIndice(7);

	face = brush->AddFace();
	face->AddIndice(0);
	face->AddIndice(1);
	face->AddIndice(5);
	face->AddIndice(4);

	face = brush->AddFace();
	face->AddIndice(2);
	face->AddIndice(3);
	face->AddIndice(7);
	face->AddIndice(6);

	face = brush->AddFace();
	face->AddIndice(1);
	face->AddIndice(2);
	face->AddIndice(6);
	face->AddIndice(5);

	face = brush->AddFace();
	face->AddIndice(0);
	face->AddIndice(3);
	face->AddIndice(7);
	face->AddIndice(4);

	//Finalize the brush
	brush->Build();
	
	//Main loop
	while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
	{
		world->Update();
		world->Render(framebuffer);
	}
	return 0;
}
```
