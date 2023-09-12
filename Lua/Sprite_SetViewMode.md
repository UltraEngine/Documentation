## Documentation

### Class: Animal

The `Animal` class represents an animal with a name and an age.

#### `Animal` constructor

Creates a new instance of the `Animal` class.

##### Parameters

- `name` (string): The name of the animal.
- `age` (number): The age of the animal.

#### `Animal.getName()` method

Gets the name of the animal.

##### Returns

- (string): The name of the animal.

#### `Animal.getAge()` method

Gets the age of the animal.

##### Returns

- (number): The age of the animal.

#### `Animal.setName(name)` method

Sets the name of the animal.

##### Parameters

- `name` (string): The new name of the animal.

#### `Animal.setAge(age)` method

Sets the age of the animal.

##### Parameters

- `age` (number): The new age of the animal.

### Function: makeAnimal

Creates a new instance of the `Animal` class.

#### Parameters

- `name` (string): The name of the animal.
- `age` (number): The age of the animal.

##### Returns

- (table): The newly created animal instance.

## Example

```lua
-- Creating a new animal instance
local myAnimal = makeAnimal("Fluffy", 3)

-- Getting the name of the animal
local name = myAnimal:getName()
print("Name: " .. name)

-- Getting the age of the animal
local age = myAnimal:getAge()
print("Age: " .. age)

-- Setting a new name for the animal
myAnimal:setName("Max")

-- Setting a new age for the animal
myAnimal:setAge(5)
```