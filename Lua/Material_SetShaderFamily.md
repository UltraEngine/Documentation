# Material:SetShaderFamily

This function sets the shader family of the material.

## Syntax

- **Material:SetShaderFamily**(shaderfamily)

## Parameters

- `shaderfamily`: The shader family to set. Must be an instance of [ShaderFamily](ShaderFamily.md).

## Example

```lua
-- Create a new shader family
local shaderFamily = ShaderFamily()

-- Set the shader family of the material
material:SetShaderFamily(shaderFamily)
```