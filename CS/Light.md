# Light

Base class: [Entity](Entity.md)

This entity emits light in a defined volume.

| Property | Type | Description | 
| ----- | ----- | ----- |
| [GetConeAngles](Light_GetConeAngles.md) | Method | gets the inner and outer cone angles of a spotlight |
| [GetFalloff](Light_GetFalloff.md) | Method | gets the light falloff mode |
| [GetShadowMapSize](Light_GetShadowMapSize.md) | Method | returns the light shadow map dimensions |
| [GetRange](Light_GetRange.md) | Method | returns the light maximum distance |
| [SetConeAngles](Light_SetConeAngles.md) | Method | sets the inner and outer cone angles of a spotlight |
| [SetFalloff](Light_SetFalloff.md) | Method | sets the light falloff mode |
| [SetRange](Light_SetRange.md) | Method | sets the light maximum distance |
| [SetShadowMapSize](Light_SetShadowMapSize.md) | Method | sets the dimensions of the light's shadow map |
| [CreateBoxLight](CreateBoxLight.md)| Function | Creates a new box light |
| [CreateDirectionalLight](CreateBoxLight.md)| Function | Creates a new directional light |
| [CreatePointLight](CreatePointLight.md)| Function | Creates a new point light |
| [CreateSpotLight](CreateSpotLight.md)| Function | Creates a new spot light |


Syntax:
```csharp
class Light : Entity
{
    float[] GetConeAngles();
    int GetFalloff();
    int GetShadowMapSize();
    float GetRange();

    void SetConeAngles(float[] angles);
    void SetFalloff(int mode);
    void SetRange(float range);
    void SetShadowMapSize(int size);

    Light CreateBoxLight(Vector3 size, Color color, float intensity);
    Light CreateDirectionalLight(Vector3 direction, Color color, float intensity);
    Light CreatePointLight(Vector3 position, Color color, float intensity);
    Light CreateSpotLight(Vector3 position, Vector3 direction, float innerConeAngle, float outerConeAngle, Color color, float intensity);
}
```