## Syntax

- void **SetPosition**(float x, float y, float z)
- void **SetPosition**(Vec3 position)

| Parameter | Description |
|---|---|
| position (x, y, z) | navigation agent position to set |

## Example

### C++

```cpp
NavAgent agent;

// Set position using individual coordinates
agent.SetPosition(10.0f, 20.0f, 30.0f);

// Set position using a Vec3 object
Vec3 position(40.0f, 50.0f, 60.0f);
agent.SetPosition(position);

```

### C#

```csharp
NavAgent agent = new NavAgent();

// Set position using individual coordinates
agent.SetPosition(10.0f, 20.0f, 30.0f);

// Set position using a Vec3 object
Vec3 position = new Vec3(40.0f, 50.0f, 60.0f);
agent.SetPosition(position);
```