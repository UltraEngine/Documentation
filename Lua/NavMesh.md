# NavMesh

Base class: [Object](Object.md)

The Navmesh class provides an interface for pathfinding. A [NavAgent](NavAgent.md) can use a NavMesh object to navigate through a scene.

| Parameter | Type | Description |
|---|---|---|
| [Build](NavMesh_Build.md) | Method | builds the navigation mesh |
| [PlotPath](NavMesh_PlotPath.md) | Method | plots a series of points between the starting point and destination |
| [RandomPoint](NavMesh_RandomPoint.md) | Method | returns a random point on the navigation mesh |
| [SetPosition](NavMesh_SetPosition.md) | Method | moves the navigation mesh to the specified position |
| [SetRotation](NavMesh_SetRotation.md) | Method | turns the navigation mesh to the specified rotation |
| [CreateNavMesh](CreateNavMesh.md) | Function | creates a new navigation mesh |

Example:

```lua
-- Create a new navigation mesh
local navmesh = CreateNavMesh()

-- Build the navigation mesh
navmesh:Build()

-- Set the position of the navigation mesh
navmesh:SetPosition(Vector3(0, 0, 0))

-- Set the rotation of the navigation mesh
navmesh:SetRotation(Quaternion.Euler(0, 90, 0))

-- Plot a path from point A to point B
local path = navmesh:PlotPath(Vector3(0, 0, 0), Vector3(10, 0, 10))

-- Get a random point on the navigation mesh
local randomPoint = navmesh:RandomPoint()
```