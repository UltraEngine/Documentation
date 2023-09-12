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

## Method: GetConeAngles()

**Description:** gets the inner and outer cone angles of a spotlight

**Syntax:** `innerAngle, outerAngle = GetConeAngles()`

**Returns:**

- `innerAngle` (number): The inner cone angle in degrees.
- `outerAngle` (number): The outer cone angle in degrees.

## Method: GetFalloff()

**Description:** gets the light falloff mode

**Syntax:** `falloffMode = GetFalloff()`

**Returns:**

- `falloffMode` (number): The light falloff mode. (1: Linear, 2: Inverse, 3: Inverse squared)

## Method: GetShadowMapSize()

**Description:** returns the light shadow map dimensions

**Syntax:** `width, height = GetShadowMapSize()`

**Returns:**

- `width` (number): The width of the light's shadow map.
- `height` (number): The height of the light's shadow map.

## Method: GetRange()

**Description:** returns the light maximum distance

**Syntax:** `range = GetRange()`

**Returns:**

- `range` (number): The maximum distance of the light's effect.

## Method: SetConeAngles(innerAngle, outerAngle)

**Description:** sets the inner and outer cone angles of a spotlight

**Syntax:** `SetConeAngles(innerAngle, outerAngle)`

**Parameters:**

- `innerAngle` (number): The inner cone angle in degrees.
- `outerAngle` (number): The outer cone angle in degrees.

## Method: SetFalloff(falloffMode)

**Description:** sets the light falloff mode

**Syntax:** `SetFalloff(falloffMode)`

**Parameters:**

- `falloffMode` (number): The light falloff mode. (1: Linear, 2: Inverse, 3: Inverse squared)

## Method: SetRange(range)

**Description:** sets the light maximum distance

**Syntax:** `SetRange(range)`

**Parameters:**

- `range` (number): The maximum distance of the light's effect.

## Method: SetShadowMapSize(width, height)

**Description:** sets the dimensions of the light's shadow map

**Syntax:** `SetShadowMapSize(width, height)`

**Parameters:**

- `width` (number): The width of the light's shadow map.
- `height` (number): The height of the light's shadow map.

## Function: CreateBoxLight()

**Description:** Creates a new box light

**Syntax:** `light = CreateBoxLight()`

**Returns:**

- `light` (userdata): The newly created box light.

## Function: CreateDirectionalLight()

**Description:** Creates a new directional light

**Syntax:** `light = CreateDirectionalLight()`

**Returns:**

- `light` (userdata): The newly created directional light.

## Function: CreatePointLight()

**Description:** Creates a new point light

**Syntax:** `light = CreatePointLight()`

**Returns:**

- `light` (userdata): The newly created point light.

## Function: CreateSpotLight()

**Description:** Creates a new spot light

**Syntax:** `light = CreateSpotLight()`

**Returns:**

- `light` (userdata): The newly created spot light.