# World::Render

This method sends all queued rendering instructions to the rendering thread and tells it to render and display the contents of this world.

## Syntax

- void **Render**(shared_ptr<[Framebuffer](Framebuffer.md)\> framebuffer, const bool vsync = true)

| Parameter | Description |
|---|---|
| framebuffer | framebuffer to render to |
| vsync | if set to true vertical sync is enabled |

## Remarks

If vertical sync is disabled the framerate will be uncapped and will usually be higher, but screen tearing artifacts can occur. 

Vertical sync should be disabled when benchmarking performance.

Rendering in Ultra Engine is asychronous, meaning it is executed on a separate thread from your game logic. Consequently, there is some delay between the first call to World::Render and the first appearance of visible graphics on the screen. Additionally, initialization of the renderer can fail if the hardware it is running on does not meet system requirements. You can evaluate the [STARTRENDERER](Constants.md#EventIDs) event to wait until the renderer has started drawing before you begin your game logic, to detect if the renderer has failed to initialize, and to retrieve the name of the graphics device the renderer is using. The event.data member will be set to 1 if the renderer was initialized successfully, otherwise it will be set to 0. The device name will be stored in the event.text member.
