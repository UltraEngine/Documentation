#include ".h"
	
void main(const char* args, const int argc)
{
	//Get the displays
	auto displays = ListDisplays();
  
	//Create a window
	auto window = CreateWindow(displays[0], "", 0, 0, 1280, 720, nullptr, WINDOW_CENTER | WINDOW_TITLEBAR);

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
