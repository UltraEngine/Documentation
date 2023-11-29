### Game Engine API Documentation

#### Syntax

```c++
GameObject createObject(string name, int x, int y);
void setPosition(GameObject object, int x, int y);
void setColor(GameObject object, Color color);
void setVelocity(GameObject object, int velocityX, int velocityY);
void destroyObject(GameObject object);
```

#### Parameters

- `name` (string) - The name of the game object.
- `x` (int) - The x position of the game object.
- `y` (int) - The y position of the game object.
- `object` (GameObject) - The game object to modify.
- `color` (Color) - The color to set for the game object.
- `velocityX` (int) - The x velocity of the game object.
- `velocityY` (int) - The y velocity of the game object.

#### Examples

```c++
GameObject player = createObject("Player", 0, 0);
setPosition(player, 100, 200);
setColor(player, Colors.Red);
setVelocity(player, 5, 0);
destroyObject(player);
```

**C# Equivalent:**

```csharp
GameObject player = createObject("Player", 0, 0);
setPosition(player, 100, 200);
setColor(player, Colors.Red);
setVelocity(player, 5, 0);
destroyObject(player);
```