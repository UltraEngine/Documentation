# Model:updateNormals

This method calculates new normals for every mesh in every level of detail in the model.

---

## Syntax

```lua
function Model:updateNormals()
```

## Description

The `updateNormals` method is used to recalculate the normals for each mesh in every level of detail of the model. Normals determine the direction each face is facing, which affects how the model is shaded.

---

## Example

```lua
-- Create a new model object
local myModel = Model()

-- Load the model from a file
myModel:load("myModel.obj")

-- Update the normals of the model
myModel:updateNormals()
```