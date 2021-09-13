# Material::SetZSort

This method is used to enable or disable Z-sorting on a per-material basis. Materials with Z-sorting enabled will be rendered after other objects, sorted by distance to the camera, from far to near.

## Syntax

- void **SetZSort**(const bool mode)

## Remarks

Z-sorting should only be used when you have transparent objects that you want to appear in front of other transparent objects. Large numbers of objects that use Z-sorting may result in slower performance.

| Parameter | Description |
|---|---|
| mode | Z-sorting mode |
