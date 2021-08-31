# PhysicsStats #
This class contains information about the physics thread. To enable statistics recording, you must call the [World::RecordStats](World_RecordStats.md) method.

| Property | Type | Description |
| ----- | ----- | ----- |
| activebodies | int | Number of physics bodies currently in motion |
| activejoints | int | Number of physics joints currently in motion |
| collisions | int | Number of collisions that occured in the previous frame |
| physicstime | int | Time taken to update physics, in milliseconds |
| threads | int | Number of physics threads currently in use |
