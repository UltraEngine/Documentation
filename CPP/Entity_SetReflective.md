# SetReflective

This method sets the entity reflectivity mode, which indicates whether the entity appears in reflections and influences global illumination.

## Syntax

- void **SetReflective**(const int reflect, const bool recursive = false)

| Parameters | Description |
|---|---|
| reflect | reflection mode to set, can be 0 (disabled), 1 (enabled), or 2 (automatic)
| recursive | if set to true, recursively apply the setting to all subobjects in the entity hierarchy |

## Remarks

When a reflective object near the camera moves or changes, it triggers the global illumination system to recalculate indirect lighting. It is best to minimize the frequency of global illumination updates, as continuous updating can cause flickering artifacts and slow performance.

Most entity types use the automatic reflection mode by default, meaning that reflection is enabled for static objects and disabled for dynamic objects. Lights have reflectivity enabled by default. You should disable reflectivity on lights that move or change colors, such as a flashlight or a light attached to a projectile.
