# GetHmd

This function returns the head-mounted display, for virtual reality rendering.

## Syntax

- **Hmd** **GetHmd**(**World** world)

| Parameter | Description |
|---|---|
| world | world to display the VR controllers in |

## Returns

Returns an object representing the user's head-mounted display. This will always be returned, regardless of whether the headset is plugged in or active.

## Remarks

This function must be called before the first call to `World.Render`.

The world parameter will be ignored after the first call to this function.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CLIENTCOORDS | WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Get the VR headset
        var hmd = GetHmd(world);

        //Environment maps
        var specmap = LoadTexture("https://github.com/UltraEngine/Assets/raw/main/Materials/Environment/footprint_court/specular.dds");
        var diffmap = LoadTexture("https://github.com/UltraEngine/Assets/raw/main/Materials/Environment/footprint_court/diffuse.dds");
        world.SetEnvironmentMap(specmap, EnvironmentMapType.ENVIRONMENTMAP_BACKGROUND);
        world.SetEnvironmentMap(specmap, EnvironmentMapType.ENVIRONMENTMAP_SPECULAR);
        world.SetEnvironmentMap(diffmap, EnvironmentMapType.ENVIRONMENTMAP_DIFFUSE);

        //Create a light
        var light = CreateBoxLight(world);
        light.SetRotation(55, 35, 0);
        light.SetRange(-10, 10);
        light.SetColor(2);

        //Add a floor
        var floor = CreateBox(world, 5, 1, 5);
        floor.SetPosition(0, -0.5, 0);
        var mtl = CreateMaterial();
        mtl.SetTexture(LoadTexture("https://github.com/UltraEngine/Documentation/raw/master/Assets/Materials/Developer/griid_gray.dds"));
        floor.SetMaterial(mtl);

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```