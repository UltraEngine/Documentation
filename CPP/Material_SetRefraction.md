## Example ##

```c++
#include "UltraEngine.h"

int main(int argc, const char* argv[])
{
    //Create window
    auto displays = GetDisplays();
    auto window = CreateWindow(displays[0], "", 0, 0, 1280 * displays[0]->scale.x, 720 * displays[0]->scale.y);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();
    world->SetAmbientLight(0.1);
    world->SetSkybox("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Sky/sunset.basis");

    //Create camera
    auto camera = CreateCamera(world);
    camera->Move(0, 17, -50);
    camera->SetFOV(70);

    //Create light
    auto light = CreateDirectionalLight(world);
    light->SetColor(1);
    light->SetRotation(9, 90, 0);

    //Create material
    auto mtl = CreateMaterial();
    mtl->SetMetalness(1.0f);
    mtl->SetRoughness(0.5f);
    mtl->SetColor(0.25,0.25,0.25, 0.5);
    mtl->SetTransparent(true);
    mtl->SetRefractiveIndex(0.95);

    //Load model
    auto model = LoadModel(world,"https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Models/Stanford/dragon.glb");
    model->SetMaterial(mtl, true);
   
    //Main loop
    while (!window->KeyHit(KEY_ESCAPE) and !window->Closed())
    {
        model->Turn(0, 0.5, 0);

        //Sync with the physics thread
        world->Update();

        //Sync with the rendering thread
        world->Render(framebuffer);
    }
    return 0;
}
```
