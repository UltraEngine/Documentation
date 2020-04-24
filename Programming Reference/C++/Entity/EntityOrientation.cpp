void main()
{
  auto displays = ListDisplays()
  
  auto window = CreateWindow("",0,0,1280,720,nullptr,WINDOW_CENTER | WINDOW_TITLEBAR)

    
  box->SetPosition(1,0,0);
  box->SetRotation(0,0,45);
  box->SetScale(2,1,1);
    
  while (window->Closed() == false)
  {
    world->Update();
    world->Render(framebuffer);
  }
}
