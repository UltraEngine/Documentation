# Material

Base class: [Asset](Asset.md)

This class is used to control the appearance of rendered surfaces.

| Property | Type | Description |
|---|---|---|
| color | const [Vec4](Vec4.md)& | read-only material color |
| textures | const table | read-only list of material textures |
| [GetColor](Material_GetColor.md) | Method | gets the material color |
| [GetMetalness](Material_GetMetalness.md) | Method | gets the material metalness |
| [GetRoughness](Material_GetRoughness.md) | Method | gets the material roughness |
| [GetShaderFamily](Material_GetShaderFamily.md) | Method | gets the material shader family |
| [GetTexture](Material_GetTexture.md) | Method | gets a material texture |
| [GetTransparent](Material_GetTransparent.md) | Method | gets the material transparency mode |
| [SetColor](Material_SetColor.md) | Method | sets the material color |
| [SetDisplacement](Material_SetDisplacement.md) | Method | controls the maximum vertex displacement |
| [SetMetalness](Material_SetMetalness.md) | Method | sets the material metalness |
| [SetRoughness](Material_SetRoughness.md) | Method | sets the material roughness |
| [SetShaderFamily](Material_SetShaderFamily.md) | Method | sets the material shader family |
| [SetTessellation](Material_SetTessellation.md) | Method | controls material tessellation |
| [SetTexture](Material_SetTexture.md) | Method | sets a material texture |
| [SetTransparent](Material_SetTransparent.md) | Method | sets the material transparency mode |
| [CreateMaterial](CreateMaterial.md) | Function | creates a new material |
| [LoadMaterial](LoadMaterial.md) | Function | loads a material from a file |

## Example

```lua
-- Create a new material
local material = CreateMaterial()

-- Set the material color
material:SetColor(Vec4(1, 0, 0, 1))

-- Get the material color
local color = material:GetColor()

-- Set a texture to the material
local texture = LoadTexture("texture.png")
material:SetTexture(texture)

-- Get the textures of the material
local textures = material.textures

-- Set the material metalness
material:SetMetalness(0.5)

-- Get the material metalness
local metalness = material:GetMetalness()

-- Set the material roughness
material:SetRoughness(0.2)

-- Get the material roughness
local roughness = material:GetRoughness()

-- Set the material shader family
material:SetShaderFamily("PBR")

-- Get the material shader family
local shaderFamily = material:GetShaderFamily()

-- Set the material transparency mode
material:SetTransparent(true)

-- Get the material transparency mode
local transparent = material:GetTransparent()

-- Set the maximum vertex displacement of the material
material:SetDisplacement(0.1)

-- Control material tessellation
material:SetTessellation(true)
```