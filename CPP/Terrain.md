# Terrain

Base class: [Entity](Entity.md)

This class handles outdoor landscapes.

| Property | Type | Description |
|-----|-----|-----|
| heightmap | const shared_ptr<[Pixmap](Pixmap.md)\>& | read-only pixmap containing terrain elevation data |
| material | const shared_ptr<[Material](Material.md)\>& | read-only material containing height and normal textures |
| resolution | const [iVec2](iVec2.md)& | read-only terrain resolution |
| [GetElevation](Terrain_GetElevation.md) | Method | returns the scaled terrain height |
| [GetHeight](Terrain_GetHeight.md) | Method | returns the heightmap height at the specified point |
| [GetLayers](Terrain_GetLayers.md) | Method | returns the layers in use at the specified point |
| [GetLayerWeight](Terrain_GetLayerWeight.md) | Method | returns the weight of the layer at the specified point |
| [GetNormal](Terrain_GetNormal.md) | Method | returns the normal of the terrain at the specified position |
| [GetSlope](Terrain_GetSlope.md) | Method | returns the slope of the terrain at the specified position |
| [GetTileHidden](Terrain_GetTileHidden.md) | Method | gets the visibility of a single terrain tile |
| [LoadHeightmap](Terrain_LoadHeightmap.md) | Method | loads a heightmap from a file |
| [SetHeight](Terrain_SetHeight.md) | Method | sets the terrain height at the specified point |
| [SetMaterial](Terrain_SetLayerWeight.md) | Method | sets the layer to be used at the specified point |
| [SetTileHidden](Terrain_SetTileHidden.md) | Method | hides or shows a single terrain tile |
| [CreateTerrain](CreateTerrain.md) | Function | creates a new terrain entity |
