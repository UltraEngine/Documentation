# Material

Base class: [Asset](Asset.md)

This class is used to control the appearance of rendered surfaces.

| Property | Type | Description |
|---|---|---|
| color | readonly [Vec4](Vec4.md) | read-only material color |
| textures | readonly List<[Texture](Texture.md)> | read-only list of material textures |
| [GetColor](Material_GetColor.md) | Method | gets the material color |
| [GetMetalness](Material_GetMetalness.md) | Method | gets the material metalness |
| [GetRoughness](Material_GetRoughness.md) | Method | gets the material rougness |
| [GetShaderFamily](Material_GetShaderFamily.md) | Method | gets the material shader family |
| [GetTexture](Material_GetTexture.md) | Method | gets a material texture |
| [GetTransparent](Material_GetTransparent.md) | Method | gets the material transparency mode |
| [SetColor](Material_SetColor.md) | Method | sets the material color |
| [SetDisplacement](Material_SetDisplacement.md) | Method | controls the maximum vertex displacement |
| [SetMetalness](Material_SetMetalness.md) | Method | sets the material metalness |
| [SetRoughness](Material_SetRoughness.md) | Method | sets the material rougness |
| [SetShaderFamily](Material_SetShaderFamily.md) | Method | sets the material shader family |
| [SetTessellation](Material_SetTessellation.md) | Method | controls material tessellation |
| [SetTexture](Material_SetTexture.md) | Method | sets a material texture |
| [SetTransparent](Material_SetTransparent.md) | Method | sets the material transparency mode |
| [CreateMaterial](CreateMaterial.md) | Function | creates a new material |
| [LoadMaterial](LoadMaterial.md) | Function | loads a material from a file |

```csharp
#region Material
public class Material : Asset
{
    public readonly Vec4 color; // read-only material color
    public readonly List<Texture> textures; // read-only list of material textures

    public Vec4 GetColor() { ... } // gets the material color
    public float GetMetalness() { ... } // gets the material metalness
    public float GetRoughness() { ... } // gets the material rougness
    public ShaderFamily GetShaderFamily() { ... } // gets the material shader family
    public Texture GetTexture(int index) { ... } // gets a material texture
    public TransparencyMode GetTransparent() { ... } // gets the material transparency mode
    
    public void SetColor(Vec4 newColor) { ... } // sets the material color
    public void SetDisplacement(float displacement) { ... } // controls the maximum vertex displacement
    public void SetMetalness(float metalness) { ... } // sets the material metalness
    public void SetRoughness(float roughness) { ... } // sets the material rougness
    public void SetShaderFamily(ShaderFamily family) { ... } // sets the material shader family
    public void SetTessellation(bool enabled) { ... } // controls material tessellation
    public void SetTexture(int index, Texture texture) { ... } // sets a material texture
    public void SetTransparent(TransparencyMode mode) { ... } // sets the material transparency mode

    public static Material CreateMaterial() { ... } // creates a new material
    public static Material LoadMaterial(string filename) { ... } // loads a material from a file
}
#endregion
```
