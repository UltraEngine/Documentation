# World::Render #
This method sends all queued rendering instructions to the rendering thread and tells it to render and display the contents of this world.

## Syntax ##
- void **Render**(shared_ptr<[Framebuffer](CPP_Framebuffer.md)\> framebuffer, const bool vsync = false)

| Parameter | Description |
|---|---|
| framebuffer | framebuffer to render to |
| vsync | if set to true vertical sync is enabled |
