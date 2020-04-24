#include "UltraEngine.h"

void main(const char* args, const int argc)
{
  auto displays = ListDisplays();
  
  auto window = CreateWindow(displays[0], "", 0, 0, 1280, 720, nullptr, WINDOW_CENTER | WINDOW_TITLEBAR);

  auto framebuffer = CreateFramebuffer(window);
    
  auto world = CreateWorld();
    
  auto camera = CreateCamera(world);
  camera->Move(0, 0, -4);
  
  auto box = CreateBox(world);    
  box->SetPosition(1, 0, 0);
  box->SetRotation(0, 0, 45);
  box->SetScale(2, 1, 1);
  
  while (window->Closed() == false)
  {
    world->Update();
    world->Render(framebuffer);
  }
}
