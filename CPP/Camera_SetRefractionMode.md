# Camera::SetRefractionMode

This method controls the camera refraction effect.

## Syntax 

- void **SetRefractionMode**(const bool mode)

## Remarks

In order for the transparency refraction effect to be visible the following conditions must exist:

- Camera refraction mode must be set to true.
- A material with a refraction value greater than zero must be visible.
- The material must have transparency set to true.
- The material must have a normal map set.
- The renderer must not be using the fallback for old graphics cards.

