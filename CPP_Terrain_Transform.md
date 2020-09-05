# Terrain::Transform #

## Example ##
```c++
#include "pch.h"
#include "Project.h"

#ifdef DOUBLE_FLOAT
void TransformTerrainPoint(const dMat4& matrix, dVec3& position, dVec3& normal, dVec3& tangent, const std::array<double, 16>& userparams)
#else
void TransformTerrainPoint(const Mat4& matrix, Vec3& position, Vec3& normal, Vec3& tangent, const std::array<float,16>& userparams)
#endif
{
    float radius = 512.0;
    Vec3 center = Vec3(0, -radius, 0);
    float scale = normal.y;
    normal = (position - center).Normalize();
    position = center + normal * radius;
}

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();
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
    terrain->SetScale(1, 50, 1);
    
    // We have to specify the width, height, and format then create the pixmap from the raw pixel data.
    auto buffer = LoadBuffer("https://github.com/Leadwerks/Documentation/raw/master/Assets/Terrain/1024.r16");
    auto heightmap = CreatePixmap(1024, 1024, TEXTURE_R16, buffer);

    // Apply the heightmap to the terrain
    terrain->SetHeightMap(heightmap);
    heightmap = NULL;

    //Build normals for the entire terrain
    terrain->BuildNormals();

    //Apply our transformation callback for culling, physics, and other tasks
    std::array<dFloat, 16> params = {};
    terrain->Transform(TransformTerrainPoint, params);

    //Set a custom shader family. This will apply the same transform equation in the vertex shader so the visible terrain matches the game terrain
    auto family = LoadShaderFamily("Shaders/CustomTerrain.json");
    terrain->material->SetShaderFamily(family);

    //Main loop
    while (window->Closed() == false)
    {
        float y = 0, z = 0;
        float yaw = camera->rotation.y;
        if (window->KeyDown(KEY_W)) z += 5;
        if (window->KeyDown(KEY_S)) z -= 5;
        if (window->KeyDown(KEY_D)) yaw += 1;
        if (window->KeyDown(KEY_A)) yaw -= 1;
        if (window->KeyDown(KEY_E)) y += 5;
        if (window->KeyDown(KEY_Q)) y -= 5;

        camera->SetRotation(0, yaw, 0);
        camera->Move(0, y, z);
        camera->SetRotation(15, yaw, 0);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
