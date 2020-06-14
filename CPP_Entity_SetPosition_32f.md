# Entity::SetPosition
This method sets the position of an entity in 3-dimensional space, using local or global coordinates.

## Syntax
* void **SetPosition**(const float x, const float y, const float z, const bool global = false)
* void **SetPosition**(const [Vec3](CPP_Vec3.md)& position, const bool global = false)

### Parameters ###
| Name | Description |
| ------ | ------ |
| **x** | X component of the specified position. |
| **y** | Y component of the specified position. |
| **z** | Z component of the specified position. |
| **position** | the position to set. |
| **global** | indicates whether the position should be set in global or local space. |

## Remarks
An entity can be positioned in local or global coordinates. Local coordinates are relative to the entity parent's space. If the entity does not have a parent, local and global coordinates are the same.

The engine uses a left-handed coordinate system. The X axis points to the right, the Y axis points up, and the Z axis points forward.

## Example
```C++
#include "pch.h"
#include "Project.h"

void main(const char* args, const int argc)
{
	//Get the displays
	auto displays = ListDisplays();
  
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
