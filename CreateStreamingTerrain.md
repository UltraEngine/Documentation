# CreateStreamingTerrain
This function creates a new streaming terrain. This type of terrain loads height and other data into memory only as it is needed, allowing display of very large landscapes.
### Syntax
```
CreateStreamingTerrain(std.shared_ptr<World> world, const int resolution, const int patchsize = nullptr)
```
### Parameters
| Name | Description |
| ------ | ------ |
| world | World to create the terrain in. |
| resolution | Number of terrain points along one edge. |
| patchsize | The size of one patch of terrain, This should be a power-of-two number. 128 is a good setting.|
| datapath | The file path or URL to the terrain data.|
| FetchPatchInfo | A user-defined callback function that retrieves terrain information as it is needed. |
### Returns
Returns a new streamed terrain.
### Example
``` 
auto terrain = CreateStreamingTerrain(world, 16384, 128, "Terrain/16384/16384.dds");
terrain->SetScale(1,1000,1);
```
