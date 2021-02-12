# Entity::SetColor #
This method can be used to colorize a visible entity such as a model or light.

## Syntax ##
- void **SetColor**(const [Vec4](Vec4.md)& color, const bool recursive = false)
- void **SetColor**(const float r, const float g, const float b, const float a, const bool recursive = false)
- void **SetColor**(const float r, const float g, const float b, const bool recursive = false)
- void **SetColor**(const float luminance, const bool recursive = false)

### Parameters ###

| Name | Description |
| --- | --- |
| **color** | RGBA color to set |
| **r** | red component of the color to set |
| **g** | green component of the color to set |
| **b** | blue component of the color to set |
| **a** | alpha component of the color to set |
| **luminance** | RGB brightness to set |
| **recursive** | if set to true the entity subhierarchy will also be affected |