# Model:Save

This method saves the model to a file, in glTF or Wavefront OBJ format.

## Syntax

`Model:Save(path: string, flags: number) -> boolean`

## Parameters

- `path` (string): file path to save
- `flags` (number): optional save flags

## Returns

Returns `true` if the model is successfully saved, otherwise `false` is returned.

## Example

```lua
-- Import required libraries
-- ...

-- Create model
local model = CreateBox(nil)

-- Save to file
if model:Save("box.obj") then
  -- Show file
  OpenDir("box.obj")
end
```