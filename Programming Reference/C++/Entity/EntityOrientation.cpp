void main()
{
  auto displays = ListDisplays()
  
  auto window = CreateWindow("",0,0,1280,720,nullptr,WINDOW_CENTER | WINDOW_TITLEBAR)

  while (window->Closed() == false)
  {
    world->Update();
    world->Render(framebuffer);
  }
}
