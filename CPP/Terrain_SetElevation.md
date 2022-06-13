# Terrain::SetElevation

This method sets the height of the terrain in global space.

## Syntax

- void **SetElevation**(const [iVec2](iVec2.md)& position, const float elevation)
- void **SetElevation**(const int x, const int y, const float elevation)

| Parameter | Description |
|---|---|
| position | position of the point to modify |
| x | x coordinate of the point to modify |
| y | y coordinate of the point to modify |
| elevation | height to set, between 0.0 and the terrain's vertical scale |

## Example

Needs work...

```c++
#include "UltraEngine.h"
//import UltraEngine;

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();
   
    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1600, 900, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR | WINDOW_CLIENTCOORDS);
    
    //Create a world
    auto world = CreateWorld();
    auto plg = LoadPlugin(GetPath(PATH_DOCUMENTS) + "/Ultra Engine/Plugins/LELegacy");
    auto plg2 = LoadPlugin(GetPath(PATH_DOCUMENTS) + "/Ultra Engine/Plugins/FITextureLoader");
    auto plg3 = LoadPlugin(GetPath(PATH_DOCUMENTS) + "/Ultra Engine/Plugins/ISPCTexComp");

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);
    framebuffer->GetSize();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->SetPosition(0, 0, -15);
    camera->SetClearColor(0.125);
    //camera->SetWireframe(true);

    auto mousepos = window->GetMouseAxis();
    Vec3 camerarotation = Vec3(0,0,0);
    const float mouselookspeed = 100.0f;
    Vec3 lookchange;
    const float mousesmoothing = 0.5f;// 0.75f;

    auto terrain = CreateTerrain(world, 1024, 1024);
    terrain->SetHeight(0, 0, 10.0f);

    terrain->LoadHeightmap("heightmap.r16");
    terrain->SetScale(1, 300, 1);
    terrain->SetPosition(0,-100,0);

    auto mtl = CreateMaterial();
    mtl->SetTexture(LoadTexture("Materials/Terrain/basecolor.png"), TEXTURE_DIFFUSE);
    mtl->SetTexture(LoadTexture("Materials/Terrain/normal.png"), TEXTURE_NORMAL);
    //mtl->SetColor(0, 1, 0, 1);

    auto mtl2 = CreateMaterial();
    mtl2->SetTexture(LoadTexture("Materials/Terrain/Ground015_2K_Color.png"), TEXTURE_DIFFUSE);
    mtl2->SetTexture(LoadTexture("Materials/Terrain/Ground015_2K_NormalGL.png"), TEXTURE_NORMAL);
   //mtl2->SetColor(0, 0, 1, 1);

    //auto layer = terrain->AddLayer(mtl);
    //mtl->SetColor(1, 0, 1, 1);

    //terrain->heightmap->MakeNormalMap();

    //terrain->SetMaterial(mtl);
    auto tm = Millisecs();

    terrain->SetMaterial(mtl);
    
    int x, y;
    float mix;
    //float avg = 0;
    for (x = 0; x < terrain->resolution.x / 2; x++)
    {
        for (y = 0; y < terrain->resolution.y; y++)
        {
            //mix = Random();
            //if (mix > 0.5)
            //terrain->SetMaterial(x, y, mtl, 0.5f, false);
            //terrain->SetMaterial(x, y, mtl2, 1.0f, true);
            //terrain->SetMaterial(x+1, y, mtl2, 1.0f, true);
            //terrain->SetMaterial(x, y+1, mtl2, 1.0f, true);
            //terrain->SetMaterial(x+1, y+1, mtl2, 1.0f, true);
            terrain->SetMaterial(x, y, mtl2, 1.0f, true);
            //terrain->SetMaterial(x + 1, y, mtl2, 1.0f, false);
            //terrain->SetMaterial(x, y + 1, mtl2, 1.0f, false);
            //terrain->SetMaterial(x + 1, y + 1, mtl2, 1.0f, false);
        }
    }
    //avg /= float(terrain->resolution.x * terrain->resolution.y);
    //Print(avg);
    Print(Millisecs() - tm);
    tm = Millisecs();

    terrain->BuildTiles(0, 0, terrain->resolution.x, terrain->resolution.y);

    Print(Millisecs() - tm);

    auto light = CreateLight(world, LIGHT_POINT);
    light->SetPosition(50,50,-60);
    light->SetRange(1000);
    light->SetFalloff(LIGHT_FALLOFF_LINEAR);

    camera->SetFOV(70);
    bool tess = false;

    auto fw = CreateFileSystemWatcher("Shaders");

    auto sphere = CreateSphere(world, 10);
    sphere->SetHidden(true);
    sphere->SetPickMode(PICK_NONE);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (window->MouseDown(MOUSE_LEFT))
        {
            auto mousepos = window->GetMousePosition();
            PickInfo pickinfo;
            if (camera->Pick(framebuffer, mousepos.x, mousepos.y, pickinfo))
            {
                //pickinfo.entity->SetHidden(true);
                sphere->SetPosition(pickinfo.position);
                //Print("PICK");
                if (pickinfo.entity == terrain)
                {
                    iVec2 pos;
                    pos.x = Round(pickinfo.position.x) + terrain->resolution.x / 2;
                    pos.y = Round(pickinfo.position.z) + terrain->resolution.y / 2;
                    float h = terrain->GetElevation(pos.x, pos.y);
                    h += 1.0;
                    terrain->SetElevation(pos.x, pos.y, h);
                }
            }
        }
        //if (window->KeyDown(KEY_RIGHT)) model->Turn(0, 1, 0);

        while (PeekEvent())
        {
            const auto ev = WaitEvent();
            //gui->ProcessEvent(ev);
            if (ev.id == EVENT_FILECREATE or ev.id == EVENT_FILECHANGE)
            {
                auto asset = FindCachedAsset(ev.text);
                if (asset) asset->Reload();
            }
        }

        if (window->KeyHit(KEY_R))
        {
            camera->SetWireframe(not camera->GetWireframe());
        }

        if (window->KeyHit(KEY_T))
        {
            tess = not tess;
            camera->SetTessellation(8 * float(int(tess)));
        }

        if (window->KeyHit(KEY_U))
        {
            terrain->SetHeight(0,0,0);
            //camera->SetPosition(8, 2.5, 0);
            //camera->Sync();
        }

        
        //sp->SetHidden(true);

        //if (window->KeyDown(KEY_P)) depthbias.y += 0.1f;
        //if (window->KeyDown(KEY_L)) depthbias.y -= 0.1f;
        //depthbias.x = 2.0f;
        //light->SetDepthBias(depthbias.x, depthbias.y);

     //   tower->Turn(0, 0.5, 0);
        //drag->Turn(0, 0.5, 0);

        //auto box = CreateBox(world);

        while (PeekEvent())
        {
            const auto ev = WaitEvent();
            //gui->ProcessEvent(ev);
            if (ev.id == EVENT_FILECREATE or ev.id == EVENT_FILECHANGE)
            {
                auto asset = FindCachedAsset(ev.text);
                if (asset) asset->Reload();
            }
        }

        auto newmousepos = window->GetMouseAxis();
        if (ActiveWindow() == window)
        {
            lookchange.x = lookchange.x * mousesmoothing + (newmousepos.y - mousepos.y) * mouselookspeed * (1.0f - mousesmoothing);
            lookchange.y = lookchange.y * mousesmoothing + (newmousepos.x - mousepos.x) * mouselookspeed * (1.0f - mousesmoothing);
            camerarotation.x += lookchange.x;
            camerarotation.y += lookchange.y;
            camera->SetRotation(camerarotation);
        }
        else
        {
            lookchange = Vec3(0.0f);
        }
        mousepos = newmousepos;
        float speed = 0.1f + 1.9f * int(window->KeyDown(KEY_SHIFT));
        if (window->KeyDown(KEY_E)) camera->Translate(0,speed, 0);
        if (window->KeyDown(KEY_Q)) camera->Translate(0,-speed, 0);
        if (window->KeyDown(KEY_D)) camera->Move(speed,0,0);
        if (window->KeyDown(KEY_A)) camera->Move(-speed, 0, 0);
        if (window->KeyDown(KEY_W)) camera->Move(0, 0, speed);
        if (window->KeyDown(KEY_S)) camera->Move(0, 0, -speed);

       // if (window->KeyDown(KEY_LEFT)) drag->Translate(0.05, 0, 0);
        //if (window->KeyDown(KEY_RIGHT)) drag->Translate(-0.05, 0, 0);
        if (window->KeyDown(KEY_UP))
        {
            //light->Translate(0.0, 0, 0.05);
            //light->Sync();
        }
        if (window->KeyDown(KEY_DOWN))
        {
        //    light->Translate(0.0, 0, -0.05);
          //  light->Sync();
        }

        if (window->KeyHit(KEY_SPACE))
        {
            //mtl->SetRoughness(1.0f - mtl->GetRoughness());
            //mtl2->SetRoughness(1.0f - mtl2->GetRoughness());
            //light->SetPosition(light->position.x, light->position.y, -light->position.z);
            //light->Sync();
        }
        //camera->Sync();
        //light->Sync();
        
        if (true)
        {
            auto curr = Millisecs();
            //if (curr - updatedtime > 1500)
            if (window->KeyHit(KEY_SPACE))
            {
//                updatedtime = curr;
                //light->SetPosition(-light->position.x, 2, -2);
                //light->SetPosition(light->GetPosition(true), true);
                //light->Sync();
                //camera->Render();
            }
        }

        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
