# Collider

Base class: [Asset](Asset.md)

This class provides an interface for loading and creating collision shapes for physics interactions.

| Property | Type | Description |
| ----- | ----- | ----- |
| [Save](Collider_Save.md) | Method | saves the collider to a file |
| [CreateBoxCollider](CreateBoxCollider.md) | Function | Creates a box collision shape for physics interactions. |
| [CreateCompoundCollider](CreateCompoundCollider.md) | Function | Creates a compound collision shape for physics interactions. |
| [CreateConeCollider](CreateConeCollider.md) | Function | Creates a cone collision shape for physics interactions. |
| [CreateCylinderCollider](CreateCylinderCollider.md) | Function | Creates a cylinder collision shape for physics interactions. |
| [CreateConvexHullCollider](CreateConvexHullCollider.md) | Function | Creates a convex hull collision shape for physics interactions. |
| [CreateMeshCollider](CreateMeshCollider.md) | Function | Creates a mesh collision shape for physics interactions. |
| [CreateSphereCollider](CreateSphereCollider.md) | Function | Creates a sphere collision shape for physics interactions. |
| [LoadCollider](LoadCollider.md) | Function | Loads a collision shape from a file |

## Collider

```csharp
public abstract class Collider : Asset
{
    public abstract void Save(string filename);
    public abstract BoxCollider CreateBoxCollider(Vector3 size);
    public abstract CompoundCollider CreateCompoundCollider();
    public abstract ConeCollider CreateConeCollider(float radius, float height);
    public abstract CylinderCollider CreateCylinderCollider(float radius, float height);
    public abstract ConvexHullCollider CreateConvexHullCollider();
    public abstract MeshCollider CreateMeshCollider(Mesh mesh);
    public abstract SphereCollider CreateSphereCollider(float radius);
    public abstract void LoadCollider(string filename);
}
```