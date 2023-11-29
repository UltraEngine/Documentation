## Syntax

- void **Move**(xVec3 movement)
- void **Move**(float x, float y, float z)

| Parameter | Description |
| --- | --- |
| movement, (x, y, z) | movement vector |


## Example
Here is an example of how to use the `Move` method in C#:

```csharp
// Create a new instance of the Entity class
Entity entity = new Entity();

// Define the movement vector
xVec3 movement = new xVec3(x, y, z);

// Call the Move method
entity.Move(movement);
```

```csharp
// Create a new instance of the Entity class
Entity entity = new Entity();

// Call the Move method
entity.Move(x, y, z);
```