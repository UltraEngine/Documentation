### Entity:Move

```lua
function Entity:Move(movement)
```

This method moves an entity in local space.

**Syntax:**

- `Entity:Move(movement)`
- `Entity:Move(x, y, z)`

**Parameters:**

- `movement` (table): a table representing the movement vector with the following fields:
  - `x` (number): the amount of movement along the x-axis
  - `y` (number): the amount of movement along the y-axis
  - `z` (number): the amount of movement along the z-axis
- `x`, `y`, `z` (numbers): the individual components of the movement vector

**Example:**

```lua
-- Creating a movement table
local movement = {x = 1, y = 0, z = -1}

-- Moving the entity using the movement table
Entity:Move(movement)

-- Moving the entity using individual components
Entity:Move(1, 0, -1)
```