# Entity::SetPosition

This method sets the position of an entity in 3-dimensional space, using local or global coordinates.

An entity can be positioned in local or global coordinates. Local coordinates are relative to the entity parent's space. If the entity does not have a parent, local and global coordinates are the same.

The engine uses a left-handed coordinate system. The X axis points to the right, the Y axis points up, and the Z axis points forward.

## Syntax

- void **SetPosition**(const [xVec3](xVec3.md)& position, const bool global = false) 
- void **SetPosition**(const [xVec2](xVec2.md)& position)
- void **SetPosition**(const dFloat x, const dFloat y, const dFloat z = 0.0, const bool global = false) 

| Parameter | Description |
| ------ | ------ |
| position, (x, y, z) | The position to set |
| global | Indicates whether the position should be set in global or local space |

## Example

```C++
#include "UltraEngine.h"

using namespace UltraEngine;

void main(const char* args, const int argc)
{
	//Get the displays
	auto displays = GetDisplays();
  
	//Create a window
	auto window = CreateWindow(displays[0], "", 0, 0, 1280, 720);

	//Create a framebuffer
	auto framebuffer = CreateFramebuffer(window);
    
	//Create a world
	auto world = CreateWorld();
    
	//Create a camera
	auto camera = CreateCamera(world);
	camera->Move(0, 0, -4);
  
	//Create box and set its orientation
	auto box = CreateBox(world);    
	box->SetPosition(1, 0, 0);
	box->SetRotation(0, 0, 45);
	box->SetScale(2, 1, 1);
  
	//Main loop
	while (window->Closed() == false)
	{
		//Update world
		world->Update();
		
		//Render world
		world->Render(framebuffer);
	}
}
```
