# Terrain::Transform #
This method accepts a user-defined callback function that can be used to warp terrain into different shapes, for creating planets and visualizing GIS data with different projection methods. The terrain must also use a shader family that applies the exact same calculations in the vertex shader. The callback function must be thread-safe.

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
    //Get the position and radius of the sphere
#ifdef DOUBLE_FLOAT
    dVec3 center = Vec3(userparams[0], userparams[1], userparams[2]);
#else
    Vec3 center = Vec3(userparams[0], userparams[1], userparams[2]);
#endif
    auto radius = userparams[3];

    //Get the tangent position before any modification
    Vec3 tangentposition = position + tangent;

    //Calculate the ground normal
    normal = (position - center).Normalize();

    //Calculate the transformed position
    position = center + normal * radius;

    //Calculate transformed tangent
    Vec3 tangentposnormal = (tangentposition - center).Normalize();
    tangentposition = center + tangentposnormal * radius;
    tangent = (tangentposition - position).Normalize();
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

    array <shared_ptr<Terrain>, 6> terrain;

    // We have to specify the width, height, and format then create the pixmap from the raw pixel data.
    auto buffer = LoadBuffer("https://github.com/Leadwerks/Documentation/raw/master/Assets/Terrain/1024.r16");
    auto heightmap = CreatePixmap(1024, 1024, TEXTURE_R16, buffer);

    //Set a custom shader family. This will apply the same transform equation in the vertex shader so the visible terrain matches the game terrain
    auto family = LoadShaderFamily("Shaders/CustomTerrain.json");

    const Vec3 position = Vec3(0.0f);
    const float radius = 512.0f;

    for (int n = 0; n < 6; ++n)
    {
        terrain[n] = CreateTerrain(world, 1024, 32);
        terrain[n]->SetScale(1, 50, 1);

        // Apply the heightmap to the terrain
        terrain[n]->SetHeightMap(heightmap);

        //Build normals for the entire terrain
        terrain[n]->BuildNormals();

        //Apply our transformation callback for culling, physics, and other tasks
        std::array<dFloat, 16> params = {};
        params[0] = position.x;
        params[1] = position.y;
        params[2] = position.z;
        params[3] = radius;
        terrain[n]->Transform(TransformTerrainPoint, params);

        terrain[n]->material->SetShaderFamily(family);

        Vec3 angle;
        switch (n)
        {
        case 0:
            angle = Vec3(0, 0, 90);
            break;
        case 1:
            angle = Vec3(0, 0, -90);
            break;
        case 2:
            angle = Vec3(0, 0, 0);
            break;
        case 3:
            angle = Vec3(0, 0, 180);
            break;
        case 4:
            angle = Vec3(90, 0, 0);
            break;
        case 5:
            angle = Vec3(-90, 0, 0);
            break;
        }

        terrain[n]->SetRotation(angle);
        terrain[n]->Move(0, 512, 0);
    }

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
