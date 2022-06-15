# Terrain

Base class: [Entity](Entity.md)

This class handles outdoor landscapes.

| Property | Type | Description |
|-----|-----|-----|
| heightmap | const shared_ptr<[Pixmap](Pixmap.md)\>& | pixmap containing terrain elevation data |
| material | const shared_ptr<[Material](Material.md)\>& | material containing height and normal textures |
| resolution | const iVec2& | read-only terrain resolution |
| [GetElevation](Terrain_GetElevation.md) | Method | |
| [GetHeight](Terrain_GetHeight.md) | Method | |
| [GetMaterials](Terrain_GetMaterials.md) | Method | |
| [GetMaterialWeight](Terrain_GetMaterialWeight.md) | Method | |
| [GetNormal](Terrain_GetNormal.md) | Method | |
| [GetSlope](Terrain_GetSlope.md) | Method | |
| [LoadHeightmap](Terrain_LoadHeightmap.md) | Method | |
| [SetHeight](Terrain_SetHeight.md) | Method | |
| [SetElevation](Terrain_SetElevation.md) | Method | |
| [SetMaterial](Terrain_SetMaterial.md) | Method | |
| [CreateTerrain](CreateTerrain.md) | Function | |
