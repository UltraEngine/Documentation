# Material::SetReflection

This method enables or disables reflections on the material.

- void **SetReflection**(const bool reflect)

## Remarks

If [global illumination](Camera_SetGI.md) is enabled, material reflections will show the surrounding environment. If global illumination is disabled, reflections will only display the [reflection skybox](Camera_SetSkybox.md), or a gray gradient if no reflection skybox is set.

Not all materials need to display a reflection. If a material has a very bumpy normal map, reflections won't be easily discernable, and can be disabled for faster performance.

By default, reflections are disabled on any new material.
