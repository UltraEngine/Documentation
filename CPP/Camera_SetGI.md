# Camera::SetGI

## Syntax

- void **SetGI**(const bool mode, const int resolution = 64, const float scale = 0.125, const int cascades = 3, const int bounces = 2)

| Parameter | Description |
|---|---|
| mode | global illumination mode |
| resolution | voxel grid resolution, can be 32, 64, 128, 256, or 512 |
| scale | size of one voxel |
| cascades | number of stages, can be 1, 2, 3, or 4 |
| bounces | number of light bounces, can be 1 or 2 |

## Remarks

Global illumination is a computationally expensive process and can drastically decrease rendering performance depending on the settings supplied. The default settings will provide good performance on most graphics cards.

Resolution values higher than the default can exceed hardware memory limits and should be used with caution.

## Example
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

void UpdateNormals_(shared_ptr<Entity> e)
{
    auto model = e->As<Model>();
    if (model)
    {
        for (auto lod : model->lods)
        {
            for (auto mesh : lod->meshes)
            {
                mesh->UpdateNormals();
                mesh->Finalize();
            }
        }
    }
    for (auto c : e->kids)
    {
        UpdateNormals_(c);
    }
}

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1600, 900, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();

    //auto plg = LoadPlugin(GetPath(PATH_DOCUMENTS) + "/Ultra Engine/Plugins/LELegacy.dll");
    //auto plg2 = LoadPlugin(GetPath(PATH_DOCUMENTS) + "/Ultra Engine/Plugins/FITextureLoader.dll");

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //auto building = LoadModel(world, "Models/Buildings/boberstation/boberstation.mdl");
    //auto building = LoadModel(world, "Models/Buildings/DerelictGarage/garage.mdl");
    //auto building = LoadModel(world, "Models/Buildings/guardtower01/guardtower.mdl");
    //UpdateNormals_(building);
    //building->SetPosition(20, 0, 0);
    //building->SetReflective(true, true);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetFOV(70);
    camera->SetPosition(10, 3, 0);
    //camera->SetRealTime(false);
    //camera->SetRotation(0, 180, 0);
    
    //camera->SetGI(true, 32, 1.0, 1);
    //camera->SetGI(true, 64, 0.5, 1);
    camera->SetGI(true, 128, 0.35, 1);
    //camera->SetGI(true, 256, 0.125, 1);

    auto wall = CreateBox(world, 10, 10, 0.5);
    wall->SetPosition(0, 0, 4.75);
    wall->SetReflective(true);
    wall->SetColor(0, 1, 1);
    world->SetAmbientLight(0);

    auto wall2 = CreateBox(world, 10, 10, 0.5);
    wall2->SetPosition(0, 0, -4.75);
    wall2->SetReflective(true);
    wall2->SetColor(1, 0, 0);

    auto wall3 = CreateBox(world, 0.5, 10, 9);
    wall3->SetPosition(-4.75, 0, 0);
    wall3->SetReflective(true);
    //world->SetSkybox(LoadTexture("Materials/zonesunset.tex"));

    /*auto model = LoadModel(world, "Models/Buildings/BoberStation/BoberStation.mdl");
    model->Collapse();
    model->SetReflective(1, true);
    for (auto mesh : model->lods[0]->meshes)
    {
        mesh->UpdateNormals();
        mesh->Finalize();
    }
    model->Sync();*/

    auto model = CreateBox(world, 20, 1, 20);
    model->SetPosition(0, -0.5f, 0);
    //model->MakeStatic();
    model->SetReflective(true);

    auto mtl = CreateMaterial();
    mtl->SetRoughness(1);
    mtl->SetMetalness(0);
    model->SetMaterial(mtl);

    auto drag = LoadModel(world, "https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Models/Stanford/dragon.glb");
    drag->SetScale(0.1f);
    drag->SetColor(1, 1, 1, 1, true);
   // drag->SetPosition(100, 0, 0);
    auto mtl2 = mtl->Copy()->As<Material>();
    //mtl2->SetMetalness(0.75);
   // drag->SetColor(0.5, 0.5, 0.5, 1, true);
    //mtl2->SetEmission(0, 0.5, 0);
    drag->SetMaterial(mtl2, true);
    drag->SetReflective(true);

    auto light = CreateLight(world, LIGHT_BOX);
    light->SetPosition(10, 10, -10);
    light->SetRotation(45, -45, 0);
    light->SetScale(20,20,20);
    light->SetRange(0.0f, 1.0f);
    
    //auto light = CreateLight(world, LIGHT_SPOT);
    //light->SetPosition(0, 10, 0);
    //light->SetRotation(90, 0, 0);
    //light->SetRange(0.1f, 20.0f);
    //light->SetScale(2, 1, 1);
    //light->SetFalloff(LIGHT_FALLOFF_LINEAR);
    
    //auto light = CreateLight(world, LIGHT_POINT);
    //light->SetPosition(8, 8, -7);
    //light->SetRange(0.1f, 20.0f);
    //light->SetColor(1.5);
    //light->SetFalloff(LIGHT_FALLOFF_LINEAR);
    
    /*auto light = CreateLight(world, LIGHT_STRIP);
    light->SetPosition(0, 5, -5);
    light->SetScale(1, 1, 10);
    light->SetRange(0.1f, 20.0f);
    light->SetFalloff(LIGHT_FALLOFF_LINEAR);*/

    auto sp = CreateSphere(world);
    sp->SetShadows(false);
    sp->SetParent(light, true);

    //auto cone = CreateCone(world);
    //cone->SetScale(20, 10, 20);
    //cone->SetPosition(0, 5, 0);

    wall->SetMaterial(mtl);
    wall2->SetMaterial(mtl);

    //mtl->SetTexture(LoadTexture("Materials/normaltest.jpg"), TEXTURE_NORMAL);
    //mtl2->SetTexture(LoadTexture("Materials/normaltest.jpg"), TEXTURE_NORMAL);
   // auto lt = CreateSphere(world);
   // lt->SetPosition(light->position);

    //auto volume = CreateBox(world, 1.0f);
    //volume->SetParent(light, false);
    //volume->SetPosition(0, 0, 0.5f);
    //volume->SetShadows(false);
    //volume->SetHidden(true);
    //volume->SetReflective(true);

    //camera->SetGI(true, 128, 0.25);
    //camera->SetFOV(70);
    //camera->SetGI(true, 256, 0.125, 1);

    auto fw = CreateFileSystemWatcher(CurrentDir());

    auto mousepos = window->GetMouseAxis();
    Vec3 camerarotation = Vec3(0,-90,0);
    const float mouselookspeed = 100.0f;
    Vec3 lookchange;
    const float mousesmoothing = 0.0f;// 0.75f;

    //world->SetAmbientLight(0);

    auto tower = CreateBox(world, 10, 0.5f, 10);
    tower->SetPosition(0, 5.25, 0);
    tower->SetReflective(true);
    tower->SetMaterial(mtl);
    //tower->SetColor(0,0, 0);

    bool started = false;
    uint64_t updatedtime = 0;

    Vec2 depthbias = light->GetDepthBias();

    /*
    auto plane1 = CreatePlane(world, 10, 10);
    plane1->SetRotation(90, 0, 0);
    plane1->SetColor(0, 1, 0);
    plane1->SetReflective(true);

    auto plane2 = CreatePlane(world, 10, 10);
    plane2->SetRotation(-90, 0, 0);
    plane2->SetColor(1, 0, 0);
    plane2->SetReflective(true);
    */

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        sp->SetHidden(true);

        if (window->KeyDown(KEY_P)) depthbias.y += 0.1f;
        if (window->KeyDown(KEY_L)) depthbias.y -= 0.1f;
        light->SetDepthBias(depthbias.x, depthbias.y);

     //   tower->Turn(0, 0.5, 0);
        //drag->Turn(0, 0.5, 0);

        while (PeekEvent())
        {
            const auto ev = WaitEvent();
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

        //model->SetPosition(0, 0, 0.1);
        //light->Turn(0, 0.1, 0, true);
        if (window->KeyDown(KEY_E)) camera->Translate(0,0.1, 0);
        if (window->KeyDown(KEY_Q)) camera->Translate(0,-0.1, 0);
        if (window->KeyDown(KEY_D)) camera->Move(0.1,0,0);
        if (window->KeyDown(KEY_A)) camera->Move(-0.1, 0, 0);
        if (window->KeyDown(KEY_W)) camera->Move(0, 0, 0.1);
        if (window->KeyDown(KEY_S)) camera->Move(0, 0, -0.1);
        if (window->KeyDown(KEY_LEFT)) light->Translate(0.05, 0, 0);
        if (window->KeyDown(KEY_RIGHT)) light->Translate(-0.05, 0, 0);
        if (window->KeyDown(KEY_UP)) light->Translate(0.0, 0, 0.05);
        if (window->KeyDown(KEY_DOWN)) light->Translate(0.0,0, -0.05);
        
        if (window->KeyHit(KEY_SPACE)) light->SetPosition(light->position.x, light->position.y, -light->position.z);

        //camera->Sync();
        //light->Sync();
        
        //auto temp = light->position;
        //light->SetPosition(-temp);
        //light->SetPosition(temp);

        if (started)
        {
            auto curr = Millisecs();
            //if (curr - updatedtime > 1500)
            if (window->KeyHit(KEY_SPACE))
            {
                updatedtime = curr;
                light->SetPosition(-light->position.x, 2, -2);
                //light->SetPosition(light->GetPosition(true), true);
                light->Sync();
                //camera->Render();
            }
        }

        //auto temp = light->position;
        //light->SetPosition(-temp);
        //light->SetPosition(temp);

        world->Update();
        world->Render(framebuffer, false);
    }
    return 0;
}
```
