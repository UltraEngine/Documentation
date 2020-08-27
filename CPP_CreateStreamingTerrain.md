## Example ##
```c++
#include "pch.h"
#include "Project.h"

const float TerrainHeight = 1000;

void FetchPatchInfo(shared_ptr<StreamingTerrain> terrain, TerrainPatchInfo& patchinfo)
{
    //Create path to heightmap file
    WString heightmappath = terrain->datapath + L"/LOD" + WString(patchinfo.level) + L"/" + WString(patchinfo.position.x) + L"_" + WString(patchinfo.position.y) + L".dds";

    //Load heightmap
    patchinfo.heightmap = CreatePixmap(patchinfo.size.x + 1, patchinfo.size.y + 1, TEXTURE_RED16);
    
    //Load most of the patch
    auto pixmap = LoadPixmap(heightmappath, 0, 0, LOAD_QUIET);
    if (pixmap)
    {
        Assert(pixmap->size.x + 1 == patchinfo.heightmap->size.x);
        Assert(pixmap->size.y + 1 == patchinfo.heightmap->size.y);
        pixmap->CopyRect(0,0,pixmap->size.x,pixmap->size.y,patchinfo.heightmap,0,0);
    }

    iVec2 patches = terrain->CountPatches(patchinfo.level);

    if (patchinfo.position.x < patches.x - 1)
    {
        //Copy left edge of the tile to the right of this one to the right edge of the patch
        WString path = terrain->datapath + L"/LOD" + WString(patchinfo.level) + L"/" + WString(patchinfo.position.x + 1) + L"_" + WString(patchinfo.position.y) + L".dds";
        auto pixmap = LoadPixmap(path, 0, 0, LOAD_QUIET);
        if (pixmap) pixmap->CopyRect(0, 0, 1, pixmap->size.y, patchinfo.heightmap, patchinfo.heightmap->size.x - 1, 0);
    }
    else
    {
        //Edge of terrain reached, so copy the pixels second to last from the edge to the edge 
        for (int y = 0; y < patchinfo.heightmap->size.y; ++y)
        {
            patchinfo.heightmap->WritePixel(patchinfo.heightmap->size.x - 1, y, patchinfo.heightmap->ReadPixel(patchinfo.heightmap->size.x - 2, y));
        }
    }

    if (patchinfo.position.y < patches.y - 1)
    {
        //Copy top edge of the tile beneath this one to the bottom edge of the patch
        WString path = terrain->datapath + L"/LOD" + WString(patchinfo.level) + L"/" + WString(patchinfo.position.x) + L"_" + WString(patchinfo.position.y + 1) + L".dds";
        auto pixmap = LoadPixmap(path,0,0,LOAD_QUIET);
        if (pixmap) pixmap->CopyRect(0, 0, pixmap->size.x, 1, patchinfo.heightmap, 0, patchinfo.heightmap->size.y - 1);
    }
    else
    {
        //Edge of terrain reached, so copy the pixels second to last from the edge to the edge 
        for (int x = 0; x < patchinfo.heightmap->size.x; ++x)
        {
            patchinfo.heightmap->WritePixel(x, patchinfo.heightmap->size.y - 1, patchinfo.heightmap->ReadPixel(x, patchinfo.heightmap->size.y - 2));
        }
    }

    if (patchinfo.position.x < patches.x - 1 and patchinfo.position.y < patches.y - 1)
    {
        //Copy top edge of the tile beneath this one to the bottom edge of the patch
        WString path = terrain->datapath + L"/LOD" + WString(patchinfo.level) + L"/" + WString(patchinfo.position.x + 1) + L"_" + WString(patchinfo.position.y + 1) + L".dds";
        auto pixmap = LoadPixmap(path, 0, 0, LOAD_QUIET);
        if (pixmap) pixmap->CopyRect(0, 0, 1, 1, patchinfo.heightmap, patchinfo.heightmap->size.x - 1, patchinfo.heightmap->size.y - 1);
    }
    else
    {
        //Write the lower-right pixel
        patchinfo.heightmap->WritePixel(patchinfo.heightmap->size.x - 1, patchinfo.heightmap->size.y - 1, patchinfo.heightmap->ReadPixel(patchinfo.heightmap->size.x - 2, patchinfo.heightmap->size.y - 2));
    }

    //Calculate the normal map - I'm not 100% sure on the height factor
    patchinfo.normalmap = patchinfo.heightmap->MakeNormalMap(TerrainHeight / pow(2,patchinfo.level), TEXTURE_RGBA);
}

int main(const char* args, const int argc)
{
    const int terrainsize = 32768;
    const int patchsize = 64;
    
    //Get the displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow(displays[0], "Ultra Engine", 0, 0, 1280, 720, WINDOW_TITLEBAR | WINDOW_CENTER | WINDOW_CLIENT_COORDS);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();
    world->SetAmbientLight(0);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->Move(0, TerrainHeight * 0.25, 0);
    camera->Turn(35, 0, 0);
    camera->SetRange(1, 16000);
    camera->SetWireframe(true);

    //Create a light
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(35, 45, 0);

    String datapath = "https://github.com/Leadwerks/Documentation/raw/master/Assets/Terrain/32768";
    auto terrain = CreateTerrain(world, terrainsize, patchsize, datapath, FetchPatchInfo);
    terrain->SetScale(1, TerrainHeight, 1);

    //Main loop
    while (window->Closed() == false)
    {
        //Camera controls
        dFloat z = 0.0;
        if (window->KeyDown(KEY_W)) z += 1; 
        if (window->KeyDown(KEY_S)) z -= 1;
        if (window->KeyDown(KEY_SHIFT)) z *= 10.0f;
        camera->SetRotation(0, camera->rotation.y, 0);
        camera->Move(0, 0, z);
        camera->Turn(35, 0, 0);

        dFloat y = 0.0;
        if (window->KeyDown(KEY_E)) y += 1;
        if (window->KeyDown(KEY_Q)) y -= 1;
        if (window->KeyDown(KEY_SHIFT)) y *= 10.0f;
        camera->Move(0, y, 0);

        y = 0.0;
        if (window->KeyDown(KEY_D))  y += 1;
        if (window->KeyDown(KEY_A))  y -= 1;
        camera->Turn(0, y, 0, true);

        //Update world
        world->Update();

        //Render world
        world->Render(framebuffer);
    }
}
```
