## World:SetAmbientLight

This function sets the ambient light level for the world.

### Syntax

- **World:SetAmbientLight**(r: number, g: number, b: number)
- **World:SetAmbientLight**(ambientlight: [Vec3](#Vec3))

### Parameters

- `ambientlight`, `(r, g, b)`: ambient light level

## Example

```lua
-- Set ambient light using RGB values
World:SetAmbientLight(0.7, 0.8, 0.5)

-- Set ambient light using Vec3 object
local ambientlight = Vec3(0.7, 0.8, 0.5)
World:SetAmbientLight(ambientlight)
```