## function CreateCylinder(world, radius, height, sides, heightsegs, capsegs)

This function creates a new cylinder model with a physics collider.

### Parameters:
- **world** (shared_ptr<[World](World.md)>): The world to create the model in.
- **radius** (number, optional): The radius of the cylinder. Defaults to 0.5 if not provided.
- **height** (number, optional): The height of the cylinder. Defaults to 1.0 if not provided.
- **sides** (number, optional): The number of sides of the cylinder. Defaults to 16 if not provided.
- **heightsegs** (number, optional): The number of segments along the Y axis of the cylinder. Defaults to 1 if not provided.
- **capsegs** (number, optional): The number of end cap subdivisions of the cylinder. Defaults to 1 if not provided.

### Returns:
- (shared_ptr<[Model](Model.md)>): A new model representing the created cylinder.

### Example:

```lua
local world = --[[ Obtain a shared_ptr<World> object from somewhere ]]

local cylinder = CreateCylinder(world, 0.5, 1.0, 16, 1, 1)

-- Use the created cylinder model as needed
```

Note: The example assumes that a shared_ptr<World> object named `world` is already obtained from somewhere.