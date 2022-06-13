# Terrain

This class handles outdoor landscapes.

| Property | Type | Description |
|-----|-----|-----|
| resolution | iVec2 | |
| [SetHeight](Terrain_SetHeight.md) | Method | |
| [SetElevation](Terrain_SetElevation.md) | Method | |
| [SetMaterial](Terrain_SetMaterial.md) | Method | |
| [CreateTerrain](CreateTerrain.md) | Function | |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();
    Vec2 dpiscale = displays[0]->GetScale();

    //Create a window
    auto window = CreateWindow(displays[0], "", 0, 0, 1280 * dpiscale.x, 720 * dpiscale.y);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->Turn(15, 0, 0);
    camera->Move(0, 50, -200);
    camera->SetRange(0.1, 4000);
    camera->SetFOV(70);

    //Create light
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(65, 35, 0);
    light->SetColor(2);

    //---------------------------------------------------------------
    // Create terrain
    //---------------------------------------------------------------

    auto terrain = CreateTerrain(world, 1024, 32);
    terrain->SetScale(1, 100, 1);
    if (FileType("Terrain/1024") == 0) CreateDir("Terrain/1024", true);

    //---------------------------------------------------------------
    // Load heightmap
    //---------------------------------------------------------------

    //Load saved DDS heightmap. Not any faster but easier to work with than RAW files
    auto heightmap = LoadPixmap(L"Terrain/1024/1024_H.dds");

    if (heightmap == NULL)
    {
        // We have to specify the width, height, and format then create the pixmap from the raw pixel data.
        auto buffer = LoadBuffer("https://github.com/Leadwerks/Documentation/raw/master/Assets/Terrain/1024.r16");
        heightmap = CreatePixmap(1024, 1024, TEXTURE_R16, buffer);

        //Save it for next time
        heightmap->Save("Terrain/1024/1024_H.dds");
    }

    // Apply the heightmap to the terrain
    terrain->SetHeightMap(heightmap);
    heightmap = NULL;

    //---------------------------------------------------------------
    // Normals
    //---------------------------------------------------------------

    //Load the saved normal data as a pixmap
    auto normaltangentmap = LoadPixmap(L"Terrain/1024/1024_TN.dds");

    if (normaltangentmap == NULL)
    {
        //Build normals for the entire terrain
        terrain->BuildNormals();

        //Retrieve a pixmap containing the normals in R8G8 format
        normaltangentmap = terrain->GetNormalTangentMap();

        //Save the pixmap as an uncompressed R8G8 DDS file, which will be loaded next time as a texture
        normaltangentmap->Save("Terrain/1024/1024_TN.dds");

        //Now save some textures for the static terrain example
        auto normalmap = terrain->GetNormalMap();
        auto tangentmap = terrain->GetTangentMap();

        //Convert to optimized BC5 format
        normalmap = normalmap->Convert(TEXTURE_BC5);
        tangentmap = tangentmap->Convert(TEXTURE_BC5);

        //Save the pixmaps as an compressed BC5 DDS file, which will be loaded next time as a texture
        normalmap->Save("Terrain/1024/1024_N.dds");
        tangentmap->Save("Terrain/1024/1024_T.dds");
    }
    else
    {
        //Apply the texture to the terrain. (The engine will automatically create a more optimal BC5 compressed texture.)
        terrain->SetNormalTangentMap(normaltangentmap);
    }

    normaltangentmap = NULL;

    //---------------------------------------------------------------
    // Material Layers
    //---------------------------------------------------------------

    //Add base layer
    auto mtl = LoadMaterial("Materials/Dirt/dirt01.mat");
    auto layerID = terrain->AddLayer(mtl);

    //Add rock layer
    mtl = LoadMaterial("Materials/Rough-rockface1.mtl");
    int rockLayerID = terrain->AddLayer(mtl);
    terrain->SetLayerSlopeConstraints(rockLayerID, 35, 90, 25);

    //Add snow layer
    mtl = LoadMaterial("Materials/Snow/snow01.mat");
    int snowLayerID = terrain->AddLayer(mtl);
    terrain->SetLayerHeightConstraints(snowLayerID, 50, 1000, 8);
    terrain->SetLayerSlopeConstraints(snowLayerID, 0, 35, 10);

    //---------------------------------------------------------------
    // Layer and Alpha Maps
    //---------------------------------------------------------------

    auto layermap = LoadPixmap(L"Terrain/1024/1024_L.dds");
    auto alphamap = LoadPixmap(L"Terrain/1024/1024_A.dds");

    if (layermap == NULL or alphamap == NULL)
    {
        //Apply Layers
        terrain->SetLayer(rockLayerID, 1.0);
        terrain->SetLayer(snowLayerID, 1.0);

        //Save layer map - DO NOT USE LOSSY COMPRESSION
        auto layermap = terrain->GetLayerMap();
        layermap->Save("Terrain/1024/1024_L.dds");

        //Save alpha map - Compression might be okay but decompression is not currently supported
        auto alphamap = terrain->GetAlphaMap();
        alphamap->Save("Terrain/1024/1024_A.dds");
    }
    else
    {
        //Load layer map into terrain
        terrain->SetLayerMap(layermap);

        //Load alpha map into terrain
        terrain->SetAlphaMap(alphamap);
    }

    layermap = NULL;
    alphamap = NULL;

    //---------------------------------------------------------------
    // Tile Layers
    //---------------------------------------------------------------

    // This is the most expensive step to process.We can save a lot of time
    // by loading the textures straight in and skipping calculation.

    auto layertexture = LoadTexture("Terrain/1024/1024_TL.dds");
    auto alphatexture = LoadTexture("Terrain/1024/1024_TA.dds");

    if (layertexture == NULL or alphatexture == NULL)
    {
        //This can take a long time
        terrain->BuildTiles();

        //Save layer map - DO NOT USE LOSSY COMPRESSION;
        auto tilelayermap = terrain->GetTileLayerMap();
        tilelayermap->Save("Terrain/1024/1024_TL.dds");

        //Save alpha map - Convert to BC7 for better efficiency. BC3 (DXT5) will cause aritfacts.
        auto tilealphamap = terrain->GetTileAlphaMap();
        auto comptamap = tilealphamap->Convert(TEXTURE_BC7);
        if (comptamap == NULL) comptamap = tilealphamap;
        tilealphamap->Save("Terrain/1024/1024_TA.dds");
    }
    else
    {
        terrain->BuildTiles();
        terrain->material->SetTexture(layertexture, TEXTURE_LAYER);
        terrain->material->SetTexture(alphatexture, TEXTURE_ALPHA);
    }

    //Main loop
    while (window->Closed() == false)
    {
        float y=0, z=0;
        if (window->KeyDown(KEY_W)) z += 5;
        if (window->KeyDown(KEY_S)) z -= 5;
        if (window->KeyDown(KEY_D)) y += 1;
        if (window->KeyDown(KEY_A)) y -= 1;

        float yaw = camera->rotation.y;
        camera->SetRotation(0, yaw, 0);
        camera->Move(0, 0, z);
        yaw += y;
        camera->SetRotation(15, yaw, 0);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
