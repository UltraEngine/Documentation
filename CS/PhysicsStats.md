# PhysicsStats #
This class contains information about the physics thread. To enable statistics recording, you must call the [World.RecordStats](World_RecordStats.md) method.

| Property | Type | Description |
| ----- | ----- | ----- |
| activebodies | int | Number of physics bodies currently in motion |
| activejoints | int | Number of physics joints currently in motion |
| collisions | int | Number of collisions that occured in the previous frame |
| physicstime | int | Time taken to update physics, in milliseconds |
| threads | int | Number of physics threads currently in use |


## Syntax ##

### C# ###
```csharp
public class PhysicsStats
{
    public int activebodies { get; }
    public int activejoints { get; }
    public int collisions { get; }
    public int physicstime { get; }
    public int threads { get; }
}
```

## Example ##

### C# ###
```csharp
// Enable recording of statistics
World.RecordStats();

// Access physics stats
PhysicsStats stats = new PhysicsStats();

// Get number of active bodies
int numActiveBodies = stats.activebodies;

// Get number of active joints
int numActiveJoints = stats.activejoints;

// Get number of collisions in previous frame
int numCollisions = stats.collisions;

// Get time taken to update physics
int physicsTime = stats.physicstime;

// Get number of physics threads in use
int numThreads = stats.threads;
```