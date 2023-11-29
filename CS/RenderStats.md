# RenderStats #

This class contains information about the rendering thread. To enable statistics recording, you must call the [World.RecordStats](World_RecordStats.md) method.

| Property | Type | Description |
| ----- | ----- | ----- |
|		 cameras | int | Number of cameras rendered in the previous frame, not including shadow updates.|
|		 cullingtime | int | Time taken to calculate current visibility set |
|		 instances | int | Number of instances drawn in the previous frame |
|		 framerate | int | Smoothed current average framerate |
| 		 meshbatches | int | Number of mesh batches drawn in the previous frame.|
|		 polygons | int | Number of polygons drawn in the previous frame, including shadows |
|		 shaderbatches | int | Number of shader batches drawn in the previous frame |
|		 shadows | int | Number of shadows updated in the previous frame |
|		 shadowpolygons | int | Number of shadow polygons drawn in the previous frame |
|		 rendertime | int | CPU time taken to render the previous frame, in milliseconds |
|		 vertices | int | Number of vertices drawn in the previous frame |
|		 vram | ulong | Phyical device memory limit |

## C# Equivalent ##

```csharp
public class RenderStats
{
    public int Cameras { get; set; }
    public int CullingTime { get; set; }
    public int Instances { get; set; }
    public int Framerate { get; set; }
    public int MeshBatches { get; set; }
    public int Polygons { get; set; }
    public int ShaderBatches { get; set; }
    public int Shadows { get; set; }
    public int ShadowPolygons { get; set; }
    public int RenderTime { get; set; }
    public int Vertices { get; set; }
    public ulong VRAM { get; set; }
}
```