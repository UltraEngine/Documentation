# CreateStreamingTerrain
This function creates a new streaming terrain. This type of terrain loads height and other data into memory only as it is needed, allowing display of very large landscapes.

### Syntax
* [StreamingTerrain](StreamingTerrain.md) **CreateStreamingTerrain**([World](../World/World.md) world, number resolution, number patchsize, string datapath);

* [StreamingTerrain](StreamingTerrain.md) **CreateStreamingTerrain**([World](../World/World.md) world, number resolution, number patchsize, string datapath);

### Parameters
| Name | Description |
| ------ | ------ |
| world | World to create the terrain in. |
| resolution | Number of terrain points along one edge. |
| patchsize | The size of one patch of terrain, This should be a power-of-two number. 128 is a good setting.|
| datapath | The file path or URL to the terrain data.|

### Return Value
If successful this function returns a new streaming terrain object, otherwise nil is returned.

### Example
[Streaming Terrain Example](terrain-example.md)
