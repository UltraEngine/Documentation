# PhysicsStats

This class contains information about the physics thread. To enable statistics recording, you must call the [World:RecordStats](World_RecordStats.md) method.

| Property | Type | Description |
| ----- | ----- | ----- |
| activebodies | number | Number of physics bodies currently in motion |
| activejoints | number | Number of physics joints currently in motion |
| collisions | number | Number of collisions that occurred in the previous frame |
| physicstime | number | Time taken to update physics, in milliseconds |
| threads | number | Number of physics threads currently in use |
