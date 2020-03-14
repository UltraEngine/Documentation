# CreateStreamingTerrain
This function creates a new streaming terrain. This type of terrain loads height and other data into memory only as it is needed, allowing display of very large landscapes.

### Syntax
* shared_ptr\<[StreamingTerrain](README.md)\> **CreateStreamingTerrain**(shared_ptr\<[World](../World/World.md)\> *world*, const int *resolution*, const int *patchsize*, const string& *datapath*, void *FetchPatchInfo*([TerrainPatchInfo](../TerrainPatchInfo/TerrainPatchInfo.md)\*) = NULL)

* shared_ptr\<[StreamingTerrain](README.md)\> **CreateStreamingTerrain**(shared_ptr\<[World](../World/World.md)\> *world*, const int *resolution*, const int *patchsize*, const wstring& *datapath*, void *FetchPatchInfo*([TerrainPatchInfo](../TerrainPatchInfo/TerrainPatchInfo.md)\*) = NULL)

### Parameters
| Name | Description |
| ------ | ------ |
| world | World to create the terrain in. |
| resolution | Number of terrain points along one edge. |
| patchsize | The size of one patch of terrain, This should be a power-of-two number. 128 is a good setting.|
| datapath | The file path or URL to the terrain data.|
| FetchPatchInfo | A user-defined callback function that retrieves terrain information as it is needed. |

### Return Value
If successful this function returns a new streaming terrain object, otherwise NULL is returned.

### Example
[Streaming Terrain Example](Streaming Terrain.cpp)
