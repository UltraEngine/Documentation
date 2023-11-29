# NavMesh

Base class: [Object](Object.md)

The Navmesh class provides an interface for pathfinding. A [NavAgent](NavAgent.md) can use a NavMesh object to navigate through a scene.

| Parameter | Type | Description |
|---|---|---|
| [Build](NavMesh_Build.md) | Method | builds the navigation mesh |
| [PlotPath](NavMesh_PlotPath.md) | Method | plots a series of points between the starting point and destination |
| [RandomPoint](NavMesh_RandomPoint.md) | Method | returns a random point on the navigation mesh |
| [SetPosition](NavMesh_SetPosition.md) | Method | moves to navigation mesh to the specified position |
| [SetRotation](NavMesh_SetRotation.md) | Method | turns to navigation mesh to the specified rotation |
| [CreateNavMesh](CreateNavMesh.md) | Function | creates a new navigation mesh |

## C# Syntax

```csharp
public class NavMesh : Object
{
    public void Build()
    {
        // builds the navigation mesh
    }

    public void PlotPath()
    {
        // plots a series of points between the starting point and destination
    }

    public void RandomPoint()
    {
        // returns a random point on the navigation mesh
    }

    public void SetPosition()
    {
        // moves to navigation mesh to the specified position
    }

    public void SetRotation()
    {
        // turns to navigation mesh to the specified rotation
    }

    public NavMesh CreateNavMesh()
    {
        // creates a new navigation mesh
    }
}
```