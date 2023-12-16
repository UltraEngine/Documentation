# UnlockAchievement

This functions sets an achievement for a user's account for the game.

## Syntax

- bool **UnlockAchievement**(const [WString](WString.md)& name)

| Parameter | Description |
|---|---|
| name | name of the achievement set in the Steamworks game settings |

## Returns

Returns true if the achievement was successfully added. If the achievement does not exist or could not be set then false is returned.

## Remarks

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/achievements/ach_guide) for more information on creating achievements for your game.

## Example

```c++
#include "UltraEngine.h"
#include "Steamworks/Steamworks.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    // Initialize Steamworks
    if (not Steamworks::Initialize())
    {
        RuntimeError("Steamworks failed to initialize.");
        return 1;
    }
    
    // Get the displays
    auto displays = GetDisplays();

    // Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280 * displays[0]->scale, 720 * displays[0]->scale, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    // Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    // Create world
    auto world = CreateWorld();

    // Create camera
    auto camera = CreateCamera(world);

    // Main loop
    while (not window->KeyDown(KEY_ESCAPE) and not window->Closed())
    {
        // Press A to win!
        if (window->KeyHit(KEY_A)) Steamworks::UnlockAchievement("ACH_TRAVEL_FAR_SINGLE");

        // Update world
        world->Update();

        // Update Steamworks
        Steamworks::Update();

        // Render world
        world->Render(framebuffer);
    }

    // Close Steamworks
    Steamworks::Shutdown();
    return 0;
}
```
