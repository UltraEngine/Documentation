# SetReflective

This method sets the entity reflectivity mode, which indicates whether the entity appears in reflections and influences global illumination.

## Syntax

- void **SetReflective**(const int reflect)

| Parameters | Description |
|---|---|
| reflect | Reflection mode to set, can be 0 (disabled), 1 (enabled), or 2 (automatic)

## Remarks

When a reflective object near the camera moves or changes, it triggers the global illumination system to recalculate indirect lighting.

Most entity types use the automatic reflection mode by default, meaning that reflection is enabled for static objects and disabled for dynamic objects. Directional lights have reflectivity enabled by default.
