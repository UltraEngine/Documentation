# Model::Animate
This method causes an animation sequence to play.

## Syntax
* void Animate(const int sequence = 0, const float speed = 1.0f, const int blendtime = 250, const AnimationMode mode = ANIMATION_LOOP)
* void Animate(const string sequence, const float speed = 1.0f, const int blendtime = 250, const AnimationMode mode = ANIMATION_LOOP)
* void Animate(const wstring sequence, const float speed = 1.0f, const int blendtime = 250, const AnimationMode mode = ANIMATION_LOOP)

### Parameters
| Name | Description |
| ------ | ------ |
| sequence | animation sequence to play. |
| blendtime | animation transition time, in milliseconds |
| mode | animation playback mode. This can be ANIMATION_LOOP, ANIMATION_ONCE, or ANIMATION_STOP |

## Example
```c++
#include "pch.h"

using namespace Leadwerks;

int main(int argc, const char* argv[])
{
	//Get the displays
	auto displays = ListDisplays();
  
	//Create a window
	auto window = CreateWindow(displays[0], "", 0, 0, 1280, 720, null, WINDOW_CENTER | WINDOW_TITLEBAR);

	//Create a framebuffer
	auto framebuffer = CreateFramebuffer(window);
    
	//Create a world
	auto world = CreateWorld();
    
	//Create a camera
	auto camera = CreateCamera(world);
	camera.Move(0, 0, -4);
  
  	//JPEG loader required for textures
	auto plugin = LoadPlugin("Plugins/FreeImage")
  
  	//Load a model
	auto model = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Fox.glb");
	model->Animate();
  
	//Main loop
	while (window->Closed() == false)
	{
		//Update world
		world->Update();
		
		//Render world
		world->Render(framebuffer);
	}
	
	return 0;
}
```
